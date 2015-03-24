/*************************************************************************/
/*                                                                       */
/*                           Cepstral, LLC                               */
/*                        Copyright (c) 2001                             */
/*                        All Rights Reserved.                           */
/*                                                                       */
/*  Permission is hereby granted, free of charge, to use and distribute  */
/*  this software and its documentation without restriction, including   */
/*  without limitation the rights to use, copy, modify, merge, publish,  */
/*  distribute, sublicense, and/or sell copies of this work, and to      */
/*  permit persons to whom this work is furnished to do so, subject to   */
/*  the following conditions:                                            */
/*   1. The code must retain the above copyright notice, this list of    */
/*      conditions and the following disclaimer.                         */
/*   2. Any modifications must be clearly marked as such.                */
/*   3. Original authors' names are not deleted.                         */
/*   4. The authors' names are not used to endorse or promote products   */
/*      derived from this software without specific prior written        */
/*      permission.                                                      */
/*                                                                       */
/*  CEPSTRAL, LLC AND THE CONTRIBUTORS TO THIS WORK DISCLAIM ALL         */
/*  WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED       */
/*  WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL         */
/*  CEPSTRAL, LLC NOR THE CONTRIBUTORS BE LIABLE FOR ANY SPECIAL,        */
/*  INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER          */
/*  RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION    */
/*  OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR  */
/*  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.          */
/*                                                                       */
/*************************************************************************/
/*             Author:  David Huggins-Daines (dhd@cepstral.com)          */
/*               Date:  December 2001                                    */
/*************************************************************************/
/*                                                                       */
/*  FliteTTSEngineObj.cpp: implementation of SAPI interface to Flite     */
/*                                                                       */
/*************************************************************************/

#include "FestivalTTSEngineObj.h"
#include "festival.h"

/* For testing endianness */
int fapi_endian_loc = 1;

CFestivalTTSEngineObj::CFestivalTTSEngineObj()
{
	sentence_start=0;
	sentence_skip=0;
	aborted=0;
	volume=0;
}


CFestivalTTSEngineObj::~CFestivalTTSEngineObj()
{
	// do nothing
}


STDMETHODIMP CFestivalTTSEngineObj::SetObjectToken(ISpObjectToken* pToken)
{

	USES_CONVERSION;
	CSpDynamicString voxdir;
	HRESULT hr;

	//const cst_val *ttwv;
	
	hr = SpGenericSetObjectToken(pToken, sapi_vox_token);

	if (FAILED(hr))
	{
		return hr;
	}
	return hr;
}


STDMETHODIMP CFestivalTTSEngineObj::GetOutputFormat(const GUID * pTargetFormatId,
				    const WAVEFORMATEX * pTargetWaveFormatEx,
				    GUID * pDesiredFormatId, 
				    WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx)
{
	
	STDMETHODIMP ret = SpConvertStreamFormatEnum(SPSF_16kHz16BitMono,
												 pDesiredFormatId,
												 ppCoMemDesiredWaveFormatEx);
 
    // TODO : check ret is OK before next line.
	// TODO : extract samples per sec from HL subclass.  
	//        Or get a dummy wave and extract the sample
	//        rate from the returned header in FT_Wave 
	//        instance.
	//
	(*ppCoMemDesiredWaveFormatEx)->nSamplesPerSec = 10000; // NOTE : hl_diphone voice is 10Khz
 
    return ret;
}


/* Each step is prev * (10**(1/10)) */
static char* sapi_ratetab_foo[21] = {
	"(Parameter.set 'Duration_Stretch 3)",
	"(Parameter.set 'Duration_Stretch 2.68787537952229)",
	"(Parameter.set 'Duration_Stretch 2.40822468528069)",
	"(Parameter.set 'Duration_Stretch 2.15766927997459)",
	"(Parameter.set 'Duration_Stretch 1.93318204493176)",
	"(Parameter.set 'Duration_Stretch 1.73205080756888)",
	"(Parameter.set 'Duration_Stretch 1.55184557391536)",
	"(Parameter.set 'Duration_Stretch 1.39038917031591)",
	"(Parameter.set 'Duration_Stretch 1.24573093961552)",
	"(Parameter.set 'Duration_Stretch 1.11612317403391)",
	"(Parameter.set 'Duration_Stretch 1)",
	"(Parameter.set 'Duration_Stretch 0.895958459840763)",
	"(Parameter.set 'Duration_Stretch 0.802741561760231",
	"(Parameter.set 'Duration_Stretch 0.719223093324865)",
	"(Parameter.set 'Duration_Stretch 0.644394014977255)",
	"(Parameter.set 'Duration_Stretch 0.577350269189626)",
	"(Parameter.set 'Duration_Stretch 0.517281857971787)",
	"(Parameter.set 'Duration_Stretch 0.46346305677197)",
	"(Parameter.set 'Duration_Stretch 0.415243646538506)",
	"(Parameter.set 'Duration_Stretch 0.372041058011302)",
	"(Parameter.set 'Duration_Stretch 0.333333333333333)"
};
static char** sapi_ratetab = sapi_ratetab_foo + 10;

static char* get_convert_sapi_rate_command(int r)
{

	if (r < -10)
		r = -10;
	else if (r > 10)
		r = 10;

	return sapi_ratetab[r];
	
}


void CFestivalTTSEngineObj::start_new_utt()
{	curr_utt_text = NULL;
	curr_utt_text_len = 0;
}

// Use this to set up other parameters in Festival - remember to call fesitival_intialise!
void CFestivalTTSEngineObj::get_actions_and_do_them()
{	DWORD actions;

    actions = site->GetActions();
	
	if (actions & SPVES_ABORT) 
	{
		aborted = 1;
		return;
	}

/*	
	if (actions & SPVES_SKIP) 
	{
		SPVSKIPTYPE stype;
		long count;

		site->GetSkipInfo(&stype, &count);
		if (stype == SPVST_SENTENCE) {
			sentence_skip += count;
		}
	}

  */
	if (actions & SPVES_RATE) 
	{   char *buff;
		long adj;	
		site->GetRate(&adj);

		//buff = get_convert_sapi_rate_command(adj);
        //festival_eval_command(get_convert_sapi_rate_command(adj));

		Sleep(10);

	}
	
	if (actions & SPVES_VOLUME) 
	{
		USHORT adj;

		site->GetVolume(&adj);
		volume = adj;

		// @todo - send a command to Festival to rescale the volume

	}

}

void CFestivalTTSEngineObj::send_sentence_event(int fpos)
{
	SPEVENT evt;

	SpClearEvent(&evt);
	evt.eEventId = SPEI_SENTENCE_BOUNDARY;
	evt.elParamType = SPET_LPARAM_IS_UNDEFINED;
	evt.ullAudioStreamOffset = bcount;
	evt.lParam = sentence_start;
	evt.wParam = fpos - sentence_start;
	site->AddEvents(&evt, 1);

	sentence_start = fpos;
}

void CFestivalTTSEngineObj::speak_frag()
{
  BOOL ret = true;  
  int heap_size = 210000;  // default scheme heap size
  int load_init_files = 1; // we want the festival init files loaded
  long adj;	
  int err=1;
  int i=0,textlen=0;
  unsigned char c;
  int strSize=0,TotStrLenInBytes=0,offset;
  site->GetRate(&adj);
  char *translit_text;
  

  TotStrLenInBytes = curr_frag->ulTextLen * 3;   //curr_frag->ulTextLen * 3 - maximum of what UT8 can be
  curr_utt_text = (char*)calloc(TotStrLenInBytes+1, sizeof(char));
  
  strSize = WideCharToMultiByte(CP_UTF8,              // Code Page
                      0,                              // Must be zero for UTF-8
                      curr_frag->pTextStart,          // Wide Character String
                      curr_frag->ulTextLen,           // No. Character in String
                      curr_utt_text,                  // Buffer for new String
                      TotStrLenInBytes+1              // Size of Buffer (In Bytes)
                      ,0,0);     

  
  if (strSize == 0)
    { AppendLog("Error \t WideCharToMultiByte","String Conversion Error",GetLastError());
    }
/*  else  
    {

      // Warning: this level of allocation will do only
      // for now (as we're not writing anything out that's
	  // more than 3 bytes per UTF8 character).

	  translit_text = (char*)calloc(TotStrLenInBytes+1, sizeof(char));
	  textlen = strlen(curr_utt_text);
	  offset = 0;

      for (i=0; i<textlen;)
         { 
		   int ret_val;
		   ret_val=transliterate(curr_utt_text,i,translit_text,&offset);
           if (ret_val == 0)
             {
               AppendLog("Error \t transliterate",&(curr_utt_text[i]),GetLastError());
			   break;
             }
		   else
             {  i+=ret_val; }
         }
	   translit_text[offset]='\0';

	   // copy into Festival buffer
	   strcpy(curr_utt_text, translit_text);
	   if (translit_text != 0) free(translit_text);
    }*/

  // Festival Initialisation
  festival_initialize(load_init_files,heap_size);

  ret = festival_eval_command("(voice_hl_diphone)");
  if (ret == false) 
    {
	  AppendLog("Error \t festival_eval_command","(voice_hl_diphone)",GetLastError());
      ret = true;
    }

  ret = festival_eval_command(get_convert_sapi_rate_command(adj));
  if (ret == false) 
    { AppendLog("Error \t festival_eval_command",get_convert_sapi_rate_command(adj),GetLastError());
    }
/*
  // Direct API calls to Festival - festival to control wave play  
  ret = festival_say_text(curr_utt_text); 
  if (ret == false) 
    { AppendLog("Error \t festival_say_text",curr_utt_text,GetLastError());
      
    }
    */
}


// Extracted from festival_client.c, no idea what the hell it does!
/*********************************************************************/

static int nist_require_swap(char *hdr)
{
    char *p;
    char *field = "sample_byte_format";

    if ((p=strstr(hdr,field)) != NULL)
    {
	if (((strncmp(" -s2 01",p+strlen(field),7) == 0) && FAPI_BIG_ENDIAN) ||
	    ((strncmp(" -s2 10",p+strlen(field),7) == 0) 
	     && FAPI_LITTLE_ENDIAN))
	    return 1;
    }
    return 0; /* if unknown assume native byte order */
}

static int nist_get_param_int(char *hdr, char *field, int def_val)
{
    char *p;
	char *q;
    int val;

	q=strstr(hdr,field);
	

    if (((p=strstr(hdr,field)) != NULL) &&
	(strncmp(" -i ",p+strlen(field),4) == 0))
    {
		sscanf(p+strlen(field)+4,"%d",&val);
		return val;
    }
	
    else
	return def_val;
}
/*********************************************************************/




void CFestivalTTSEngineObj::synth_one_utt()
{   FT_Wave *wav=0;
    EST_Wave est_wave;
	ULONG b,w;
    BOOL ret=true;
    char tmpfile[64] = "C:\\festival\\festival\\win32\\tmp\\wave";
    HANDLE fh=0;
    int flen=0,fread=0,i=0;
    char *fbuff=0;
 	
    // return if there's nothing to synth
	if (!(curr_utt_text))
		return; 
    
	ret = festival_text_to_wave(curr_utt_text,est_wave);
    if (ret == true)     
      { est_wave.save(tmpfile,"nist");  
       
        fh = CreateFile(tmpfile,GENERIC_READ|GENERIC_WRITE,
                        FILE_SHARE_READ|FILE_SHARE_WRITE,0,
                        OPEN_EXISTING,0,0);    
        if (fh != 0)
        { flen = GetFileSize(fh,0);
            if (flen != -1)
            { fbuff = (char*)calloc(1,flen); 
                fread = ReadFile(fh,fbuff,flen,&w,0);
                if (fread > 0)
                {   wav = (FT_Wave*)calloc(1,sizeof(FT_Wave));
                    wav->num_samples = nist_get_param_int(fbuff,"sample_count",0);
                    wav->sample_rate = nist_get_param_int(fbuff,"sample_rate",16000);
                    wav->samples = (short *)malloc(wav->num_samples*sizeof(short));
                    memmove(wav->samples,fbuff+1024,wav->num_samples*sizeof(short));
			        if (nist_require_swap(fbuff))
			        for (i=0; i < wav->num_samples; i++)
				    wav->samples[i] = SWAPSHORT(wav->samples[i]);
                }   
                else { AppendLog("Error \t Read File Failed",tmpfile,GetLastError()); }
            }
            else AppendLog("Error \t GetFileSize Failed",tmpfile,GetLastError());
        }
        else AppendLog("Error \t Open File Failed",tmpfile,GetLastError());          

        if (wav)
        {   site->Write(wav->samples,
					    wav->num_samples * sizeof(*wav->samples),
					    &b);
		    bcount += wav->num_samples * sizeof(*wav->samples);				
            free (wav);
	    }

        // Clean up
        if (fh !=0)
          { CloseHandle(fh);
            DeleteFile(tmpfile);        
          }
        if (fbuff != 0) free(fbuff);
	    if (curr_utt_text !=0) free(curr_utt_text);    
      }
    else  
      { AppendLog("Error \t festival_text_to_wave",curr_utt_text,GetLastError()); }



}
STDMETHODIMP CFestivalTTSEngineObj::Speak(DWORD		dwSpeakFlags,
										  REFGUID	rguidFormatId,
			                              const		WAVEFORMATEX * pWaveFormatEx,
			                              const		SPVTEXTFRAG* pTextFragList,
			                              ISpTTSEngineSite* pOutputSite)
{
	/*
	if (curr_vox == NULL)
		return E_POINTER;
	*/

	start_new_utt();
	
	bcount = 0;
	sentence_start = 0;
	sentence_skip = 0;
	aborted = 0;
	volume = 100;
	site = pOutputSite;

	for (curr_frag = pTextFragList; curr_frag && !aborted;
	     curr_frag = curr_frag->pNext) 
	{   
		//get_actions_and_do_them();

		switch (curr_frag->State.eAction) 
		{
			case SPVA_Speak:
				speak_frag();               
				break;
			case SPVA_SpellOut:
				//spell_frag();
				break;
			case SPVA_Pronounce:
			//	pronounce_frag();
				break;
			case SPVA_Silence:
			//	silence_frag();
				break;
			case SPVA_Bookmark:
			//	set_bookmark();
				break;
			default:
				break;
		}
	}

	//if (tok_rel && relation_tail(tok_rel))
	//		send_sentence_event(item_feat_int(relation_tail(tok_rel), "token_pos")
	//			    + item_feat_int(relation_tail(tok_rel),
	//					    "token_length"));
	if (curr_utt_text)
		send_sentence_event(curr_utt_text_len);

	synth_one_utt();

	site = NULL;
	festival_tidy_up();
	return 0;
	
}

int CFestivalTTSEngineObj::AppendLog(char *errType,char *msg,int errCode)
{ SYSTEMTIME lpSystemTime;
    
  char buff[256];
  char time[16];
  char date[16];
  int ret=0;
  DWORD ww;
  
  ret = (int)OpenLog();
  if (ret <= 0)
     return ret;

  ZeroMemory(buff,sizeof(buff));
  ZeroMemory(time,sizeof(time));
  ZeroMemory(date,sizeof(date));

  GetSystemTime(&lpSystemTime);
 
  sprintf(date,"%04i/%02i/%02i",lpSystemTime.wYear,lpSystemTime.wMonth,lpSystemTime.wDay);
  sprintf(time,"%02i:%02i:%02i",lpSystemTime.wHour,lpSystemTime.wMinute,lpSystemTime.wSecond);
  
  sprintf(buff,"%s %s \t %s - '%s' (%i) \r\n",date,time,errType,msg,errCode);
  if ((int)hLogFile > 0)
    {  if (SetFilePointer(hLogFile,0,0,FILE_END) == INVALID_SET_FILE_POINTER)
         { MessageBox(0,"File Pointer problem","",MB_OK);
         }
       ret = WriteFile(hLogFile,buff,strlen(buff),&ww,0);  
       CloseHandle(hLogFile);
    }
  return ret;
}


HANDLE CFestivalTTSEngineObj::OpenLog()
{ SYSTEMTIME lpSystemTime;
  int year=0, month=0;
  char filename[16];

  hLogFile=0;
  GetSystemTime(&lpSystemTime);
  year = lpSystemTime.wYear;
  month = lpSystemTime.wMonth;
  ZeroMemory(filename,sizeof(filename));
  ZeroMemory(LogFileName,sizeof(LogFileName));

  sprintf(filename, "%i%02i.txt", year,month);
  sprintf(LogFileName,"%s%s",LOGFILEPATH,filename);
  
  hLogFile =CreateFile(LogFileName,
                       GENERIC_READ|GENERIC_WRITE,
                       FILE_SHARE_READ|FILE_SHARE_WRITE,0,
                       OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);

  return hLogFile;
}



status_e CFestivalTTSEngineObj::unicode_to_festival(unsigned char c1, unsigned char c2,
													char *translit_text,int *offset)
{
  int i, found=0;
  unsigned long uc = (c1 * 256) + c2;

  /* for now, we only want to deal with the accents that 
   * the Welsh Festival 'knows' about, i.e. aeiouwyAEIOUWY
   * with circumflex, diaresis, grave and acute accents.
   * The Unicode representations of these are in the array
   * unicode_chars[]. Their string replacements are in replace[]. */

  for (i=0; unicode_chars[i]; i++)
  {
    if (unicode_chars[i] == uc)
    {
      sprintf(&(translit_text[*offset]), "%s", replace[i]);
	  *offset = *offset+strlen(replace[i]);
      return status_ok;
    }
  }
  
  return status_ok; /* not technically an error - might still be
                     * valid UTF-8 that we don't know about */
}


int CFestivalTTSEngineObj::transliterate(char *curr_utt_text,int i,
										 char *translit_text,int *offset)
{
  /* we expect most characters to be passed through
   * without needing transliteration
   * 
   * From http://www.loc.gov/marc/specifications/speccharucs.html
   *
   * left-most         meaning 
   * bits encoding
   *
   *  0                character composed of 1 octet
   *  110              first octet of 2 octet character
   *  1110             first octet of 3 octet character
   *  10               octet is not the first octet for a character,it 
                       is the 2nd, or 3rd octet of a multi-octet character
   */

  unsigned char c = curr_utt_text[i];

  unsigned char b1, b2, b3;
  unsigned char c1, c2;

  if(!(c & 0x80)) /* 1 octet */
  {
    translit_text[*offset]=c;
	*offset=*offset+1;
    return 1;
  }
   
  /* according to RFC 3629, we aren't allowed the
   * following octets in UTF-8, so return an error
   * if we come across them */
  if((c == 0xc0 || c == 0xc1) || c >= 0xf5)
    return 0;

  /* also, if we've been passed a character with the
   * left-most bits being '10', there's a stream error */
  if((c & 0x80) && !(c & 0x40))
    return 0;

  if((c >= 0xc0) && (c <= 0xe0))
  {
    b1 = c;
    b2 = curr_utt_text[i+1];

    c1 = (b1 ^ 0xc0) >> 2;
    c2 = ((b1 & 0x03) << 6) + (b2 ^ 0x80);

    if (unicode_to_festival(c1, c2, translit_text, offset) == status_ok)
		return 2;
	else
		return 0;
  }

  if(c & 0xe0) /* first byte of 3-byte character (to go in b1, b2, b3) */
  {
    b1 = c;
    if(!(b2 = getchar()))
      return status_error;
    if(!(b3 = getchar()))
      return status_error;

    c1 = (b1 << 4) + ((b2 ^ 0x80) >> 2);
    c2 = (b2 << 6) + (b3 ^ 0x80);

    if (unicode_to_festival(c1, c2, translit_text, offset) == status_ok)
		return 3;
	else
		return 0;
  }

  /* we should never get this far, so return an error */
  return 0;
}
