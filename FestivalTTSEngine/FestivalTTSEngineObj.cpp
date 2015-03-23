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
	/* may need something on destruction */
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

void parse_config_file(char *command, int *sampling_rate)
{
  /* *command must be a pointer to a pre-allocated buffer */
  char config_filename[64]="C:\\festival\\festival\\win32\\config\\config.ini";
  FILE *config_file;
  bool command_set=false,sampling_rate_set=false;

  config_file = fopen (config_filename, "r");

  if(config_file)
  {
    char buff[256];
	/* parse file */
	/* this is very basic indeed at the moment */

    while(!feof(config_file) && (!command_set || !sampling_rate_set))
	{
	  fgets(buff, 256, config_file);
	  /* skip all lines beginning with a semicolon */
	  if(buff[0]==';')
		continue;
	  if(!strncmp("command=",buff,8))
	  {
	    if ((sscanf(buff,"command=%s",command))==1)
          command_set=true;
	  }
	  if(!strncmp("sampling_rate=",buff,14))
	  {
	    if ((sscanf(buff,"sampling_rate=%d",sampling_rate))==1)
		  sampling_rate_set=true;
	  }
	}
	fclose(config_file);
  }
  else /* config_file can't be opened */
  {
    command=NULL;
	sampling_rate=0;
  }

}

STDMETHODIMP CFestivalTTSEngineObj::GetOutputFormat(const GUID * pTargetFormatId,
				    const WAVEFORMATEX * pTargetWaveFormatEx,
				    GUID * pDesiredFormatId, 
				    WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx)
{
	WAVEFORMATEX *wfx;
    HRESULT ret;
	char init_command[256];
	int sampling_rate=0;
	SPSTREAMFORMAT sf;

    /* read config file */
    /* it's probably overkill to do this every time this function
     * is called, but it gives us a handy way to change voices
     * on-the-fly */
    if(!init_command || !sampling_rate)
      parse_config_file(init_command,&sampling_rate);
    if(!init_command)
    {
	  /* can't read config file, so assume 16k sampling rate */
	  AppendLog("Error \t parse_config_file", "can't get sampling_rate", GetLastError());
	  AppendLog("Error \t parse_config_file", "assuming 16k sampling rate", GetLastError());
	  sampling_rate=16000;
    }

	/* get the necessary enum for stream format conversion */
	/* we assume 16 bit mono */
	switch (sampling_rate)
	{
	  case 8000:
		  sf=SPSF_8kHz16BitMono;
		  break;
	  case 11000:
	  case 11025:
		  sf=SPSF_11kHz16BitMono;
		  break;
	  case 12000:
		  sf=SPSF_12kHz16BitMono;
		  break;
	  case 16000:
		  sf=SPSF_16kHz16BitMono;
		  break;
	  case 22000:
	  case 22050:
		  sf=SPSF_22kHz16BitMono;
		  break;
	  case 24000:
		  sf=SPSF_24kHz16BitMono;
		  break;
	  case 32000:
		  sf=SPSF_32kHz16BitMono;
		  break;
	  case 44000:
	  case 44100:
		  sf=SPSF_44kHz16BitMono;
		  break;
	  case 48000:
		  sf=SPSF_48kHz16BitMono;
		  break;
	  default:
		  sf=SPSF_NoAssignedFormat;
		  break;
	}

	/* if we have an assigned format, use that */
	if (sf!=SPSF_NoAssignedFormat)
	{
	  ret = SpConvertStreamFormatEnum(sf, pDesiredFormatId, ppCoMemDesiredWaveFormatEx);
      if (ret == S_OK)
		return ret;
	}

	/* we'll have to do the resampling manually */

    /* adapted from FliteTTSEngineObj */
    if ((wfx = (WAVEFORMATEX *)CoTaskMemAlloc(sizeof(*wfx))) == NULL)
        return E_OUTOFMEMORY;
    memset(wfx, 0, sizeof(*wfx));
    wfx->nChannels = 1;
	wfx->nSamplesPerSec = sampling_rate;
    wfx->wFormatTag = WAVE_FORMAT_PCM;
    wfx->wBitsPerSample = 16;
    wfx->nBlockAlign = wfx->nChannels*wfx->wBitsPerSample/8;
    wfx->nAvgBytesPerSec = wfx->nSamplesPerSec*wfx->nBlockAlign;

    *pDesiredFormatId = SPDFID_WaveFormatEx;
    *ppCoMemDesiredWaveFormatEx = wfx;

    return S_OK;
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

// Use this to set up other parameters in Festival - remember to call festival_intialise!
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

/* new code - removed for temporary testing */
/*void CFestivalTTSEngineObj::send_sentence_event(int fpos)
{
	SPEVENT evt;

	SpClearEvent(&evt);
	evt.eEventId = SPEI_SENTENCE_BOUNDARY;
	evt.elParamType = SPET_LPARAM_IS_UNDEFINED;
	evt.ullAudioStreamOffset = bcount;
	evt.lParam = fpos;                      /* not sure about */
/*	evt.wParam = sentence_start;            /* these two parameters */
/*	site->AddEvents(&evt, 1);

	sentence_start += fpos;
}*/

/* old code */
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
  int strSize=0,TotStrLenInBytes=0,offset;
  char init_command[256]; 
  int sampling_rate=0;    
  site->GetRate(&adj);  

  TotStrLenInBytes = curr_frag->ulTextLen * 3;   //curr_frag->ulTextLen * 3 - maximum of what UT8 can be
  curr_utt_text = (char*)calloc(TotStrLenInBytes+1, sizeof(char));
  
  strSize = WideCharToMultiByte(CP_UTF8,              // Code Page
                      0,                              // Must be zero for UTF-8
                      curr_frag->pTextStart,          // Wide Character String
                      curr_frag->ulTextLen,           // No. Character in String
                      curr_utt_text,                  // Buffer for new String
                      TotStrLenInBytes+1              // Size of Buffer (In Bytes)
                      ,0,0);

  curr_utt_text_len = strSize;

  if (strSize == 0)
  {
    AppendLog("Error \t WideCharToMultiByte","String Conversion Error",GetLastError());
	return;
  }

  // Festival Initialisation
  festival_initialize(load_init_files,heap_size);

  /* read config file */
  /* it's probably overkill to do this every time this function
   * is called, but it gives us a handy way to change voices
   * on-the-fly */
  if(!init_command || !sampling_rate)
    parse_config_file(init_command,&sampling_rate);
  if(!init_command)
  {
	AppendLog("Error \t parse_config_file",	"can't get init command", GetLastError());
	return;
  }

/*  This used to be hard-coded along the lines of */
/*  ret = festival_eval_command("(voice_hl_diphone)"); */

  ret = festival_eval_command(init_command);
  if (ret == false)
  {
	AppendLog("Error \t festival_eval_command",init_command,GetLastError());
    ret = true;
  }

  /* adjusting the speed according to the slider setting */
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
	bcount_add = 0;
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
	if (curr_utt_text && curr_utt_text_len > 0)
	{
	    synth_one_utt();
		send_sentence_event(curr_utt_text_len);
        site = NULL;
        festival_tidy_up();
	}
	
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