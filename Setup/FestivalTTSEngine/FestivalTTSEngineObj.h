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
/*  FliteTTSEngineObj.h: implementation of SAPI interface to Festival    */
/*                                                                       */
/*************************************************************************/

#ifndef __FESTIVALTTSENGINEOBJ_H_
#define __FESTIVALTTSENGINEOBJ_H_

#define LOGFILEPATH "C:\\Festival_UT8_Transliterate\\festival\\win32\\log\\"

/* Sun, HP, SGI Mips, M68000 */
#define FAPI_BIG_ENDIAN (((char *)&fapi_endian_loc)[0] == 0)
/* Intel, Alpha, DEC Mips, Vax */
#define FAPI_LITTLE_ENDIAN (((char *)&fapi_endian_loc)[0] != 0)

#include <atlbase.h>
extern CComModule _Module;
#include <atlcom.h>
#include <spddkhlp.h>

typedef struct FT_Wave
{
    int num_samples;
    int sample_rate;
    short *samples;
} FT_Wave;


// Definitions from trosi.h
 #define NUM_CHARACTERS 57 /* plus one for null */
 #define MAX_REPLACEMENT_STRING_LENGTH 10
 static enum status_e {status_ok, status_error};
 typedef enum status_e status_e;

class ATL_NO_VTABLE CFestivalTTSEngineObj :
	public CComObjectRootEx<CComMultiThreadModel>,
	public ISpTTSEngine,
	public ISpObjectWithToken
{
public:
	/* edit FestivalTTSEngineObj.cpp for these */
	CFestivalTTSEngineObj();
	
	~CFestivalTTSEngineObj();	

    /* ISpObjectWithToken methods */
	STDMETHODIMP SetObjectToken(ISpObjectToken * pToken);
	STDMETHODIMP GetObjectToken(ISpObjectToken** ppToken)
		{ return SpGenericGetObjectToken(ppToken, sapi_vox_token); }


    /* ISpTTSEngine methods */
	STDMETHOD(Speak)(DWORD dwSpeakFlags,
					REFGUID rguidFormatId, 
					const WAVEFORMATEX * pWaveFormatEx,
					const SPVTEXTFRAG* pTextFragList, 
					ISpTTSEngineSite* pOutputSite);

	
	STDMETHOD(GetOutputFormat)(const GUID * pTargetFormatId,
				   const WAVEFORMATEX * pTargetWaveFormatEx,
				   GUID * pDesiredFormatId, 
				   WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx);

    /* SAPI's use of the term "token" is quite unfortunate. */
	CComPtr<ISpObjectToken> sapi_vox_token;
	//cst_voice *curr_vox;

	/* Synthesis state variables */
	//cst_utterance *curr_utt;
	//cst_relation *tok_rel;
	char *curr_utt_text;
	char *translit_text;
	int curr_utt_text_len;	
	const SPVTEXTFRAG *curr_frag;
	ISpTTSEngineSite *site;
	ULONGLONG bcount;
	ULONGLONG bcount_add;
	int sentence_start;
	int sentence_skip;
	int aborted;
	int volume;
    char LogFileName[256];
    HANDLE hLogFile;
private:
	void start_new_utt();
	void synth_one_utt();
	//void send_item_events();
	void send_sentence_event(int fpos);
	void get_actions_and_do_them();
    //int next_viseme(cst_item *s);
	//int viseme_len(cst_item *s);
	//int phoneme_len(cst_item *s);
	void speak_frag();
	//void spell_frag();
	//void pronounce_frag();
	//void silence_frag();
	//void set_bookmark();
	int AppendLog(char *errType,char *msg,int errCode);
    HANDLE OpenLog();

    //For 'trosi'
    status_e unicode_to_festival(unsigned char c1, unsigned char c2,char *translit_text,int *offset);
	int transliterate(char *curr_utt_text,int i,char *translit_text,int *offset);

};

#endif //__FESTIVALTTSENGINEOBJ_H_


static unsigned long unicode_chars[NUM_CHARACTERS]={
  0x00e2, /* Latin small letter a with circumflex */
  0x00ea, /* Latin small letter e with circumflex */
  0x00ee, /* Latin small letter i with circumflex */
  0x00f4, /* Latin small letter o with circumflex */
  0x00fb, /* Latin small letter u with circumflex */
  0x0175, /* Latin small letter w with circumflex */
  0x0177, /* Latin small letter y with circumflex */
  0x00c2, /* Latin capital letter A with circumflex */
  0x00ca, /* Latin capital letter E with circumflex */
  0x00ce, /* Latin capital letter I with circumflex */
  0x00d4, /* Latin capital letter O with circumflex */
  0x00db, /* Latin capital letter U with circumflex */
  0x0174, /* Latin capital letter W with circumflex */
  0x0176, /* Latin capital letter Y with circumflex */
  0x00e4, /* Latin small letter a with diaeresis */
  0x00eb, /* Latin small letter e with diaeresis */
  0x00ef, /* Latin small letter i with diaeresis */
  0x00f6, /* Latin small letter o with diaeresis */
  0x00fc, /* Latin small letter u with diaeresis */
  0x1e85, /* Latin small letter w with diaeresis */
  0x00ff, /* Latin small letter y with diaeresis */
  0x00c4, /* Latin capital letter A with diaeresis */
  0x00cb, /* Latin capital letter E with diaeresis */
  0x00cf, /* Latin capital letter I with diaeresis */
  0x00d6, /* Latin capital letter O with diaeresis */
  0x00dc, /* Latin capital letter U with diaeresis */
  0x1e84, /* Latin capital letter W with diaeresis */
  0x0178, /* Latin capital letter Y with diaeresis */
  0x00e1, /* Latin small letter a with acute */
  0x00e9, /* Latin small letter e with acute */
  0x00ed, /* Latin small letter i with acute */
  0x00f3, /* Latin small letter o with acute */
  0x00fa, /* Latin small letter u with acute */
  0x1e83, /* Latin small letter w with acute */
  0x00fd, /* Latin small letter y with acute */
  0x00c1, /* Latin capital letter A with acute */
  0x00c9, /* Latin capital letter E with acute */
  0x00cd, /* Latin capital letter I with acute */
  0x00d3, /* Latin capital letter O with acute */
  0x00da, /* Latin capital letter U with acute */
  0x1e82, /* Latin capital letter W with acute */ 
  0x00dd, /* Latin capital letter Y with acute */
  0x00e0, /* Latin small letter a with grave */
  0x00e8, /* Latin small letter e with grave */
  0x00ec, /* Latin small letter i with grave */
  0x00f2, /* Latin small letter o with grave */
  0x00f9, /* Latin small letter u with grave */
  0x1e81, /* Latin small letter w with grave */
  0x1ef3, /* Latin small letter y with grave */
  0x00c0, /* Latin capital letter A with grave */
  0x00c9, /* Latin capital letter E with grave */
  0x00cc, /* Latin capital letter I with grave */
  0x00d2, /* Latin capital letter O with grave */
  0x00d9, /* Latin capital letter U with grave */
  0x1e80, /* Latin capital letter W with grave */
  0x1ef2, /* Latin capital letter Y with grave */ 
  
  0x00};  /* must end with null */
                           

static char replace[NUM_CHARACTERS][MAX_REPLACEMENT_STRING_LENGTH]={
  "a+",
  "e+",
  "i+",
  "o+",
  "u+",
  "w+",
  "y+",
  "A+",
  "E+",
  "I+",
  "O+",
  "U+",
  "W+",
  "Y+",
  "a%",
  "e%",
  "i%",
  "o%",
  "u%",
  "w%",
  "y%",
  "A%",
  "E%",
  "I%",
  "O%",
  "U%",
  "W%",
  "Y%",
  "a/",
  "e/",
  "i/",
  "o/",
  "u/",
  "w/",
  "y/",
  "A/",
  "E/",
  "I/",
  "O/",
  "U/",
  "W/",
  "Y/",
  "a\\",
  "e\\",
  "i\\",
  "o\\",
  "u\\",
  "w\\",
  "y\\",
  "A\\",
  "E\\",
  "I\\",
  "O\\",
  "U\\",
  "W\\",
  "Y\\",

  "\0"};