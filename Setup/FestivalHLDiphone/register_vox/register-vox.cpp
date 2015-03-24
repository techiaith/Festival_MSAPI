///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                           Cepstral, LLC                               //
//                        Copyright (c) 2001                             //
//                        All Rights Reserved.                           //
//                                                                       //
//  Permission is hereby granted, free of charge, to use and distribute  //
//  this software and its documentation without restriction, including   //
//  without limitation the rights to use, copy, modify, merge, publish,  //
//  distribute, sublicense, and/or sell copies of this work, and to      //
//  permit persons to whom this work is furnished to do so, subject to   //
//  the following conditions:                                            //
//   1. The code must retain the above copyright notice, this list of    //
//      conditions and the following disclaimer.                         //
//   2. Any modifications must be clearly marked as such.                //
//   3. Original authors' names are not deleted.                         //
//   4. The authors' names are not used to endorse or promote products   //
//      derived from this software without specific prior written        //
//      permission.                                                      //
//                                                                       //
//  CEPSTRAL, LLC AND THE CONTRIBUTORS TO THIS WORK DISCLAIM ALL         //
//  WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED       //
//  WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL         //
//  CEPSTRAL, LLC NOR THE CONTRIBUTORS BE LIABLE FOR ANY SPECIAL,        //
//  INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER          //
//  RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION    //
//  OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR  //
//  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.          //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//             Author:  David Huggins-Daines (dhd@cepstral.com)          //
//               Date:  November 2001                                    //
///////////////////////////////////////////////////////////////////////////

#include <atlbase.h>
#include <stdio.h>
#include <sphelper.h>

/* CHANGEME: Include the _i.c file for your voice here instead. */
#include "../FestivalHLDiphone_i.c"

int wmain(int argc, WCHAR *argv[])
{
	USES_CONVERSION;
	HRESULT hr;

	::CoInitialize(NULL);

	ISpObjectToken *cpToken;
	ISpDataKey *cpDataKeyAttribs;

	hr = SpCreateNewTokenEx(
		SPCAT_VOICES,

		/* CHANGEME: Change the following five arguments for your voice. */
		L"Festival HL Diphone",     			/* A unique name for your voice. */
		&CLSID_FestivalHLDiphoneObj,            /* The CLSID for your voice object. */
		L"Festival Welsh Diphone Voice 0.5",    	/* Language-independent full name. */
		0x41C,									/* Language ID (Albanian is 0x41C) */
		L"Llais Cymraeg Diphone Festival 0.5",	/* Language-dependent full name. */
		&cpToken,
		&cpDataKeyAttribs);

	//--- Set additional attributes for searching and the path to the
	//    voice data file we just created.
	if (SUCCEEDED(hr))
	{
		/* CHANGEME: The gender of your speaker. */
                hr = cpDataKeyAttribs->SetStringValue(L"Gender",
						      L"Male");

		/* CHANGEME: The name of your speaker. */
                if (SUCCEEDED(hr))
			hr = cpDataKeyAttribs->SetStringValue(L"Name",
							      L"Festival Welsh Diphone Voice 0.5");

		/* CHANGEME: The language IDs supported by your voice. */
                if (SUCCEEDED(hr))
			hr = cpDataKeyAttribs->SetStringValue(L"Language",
							      /* US English;
								 English */
							      L"41C");

		/* CHANGEME: The general age of your speaker (Adult, Child). */
                if (SUCCEEDED(hr))
			hr = cpDataKeyAttribs->SetStringValue(L"Age",
							      L"Adult");

		/* CHANGEME: The vendor name for your voice. */
                if (SUCCEEDED(hr))
			hr = cpDataKeyAttribs->SetStringValue(L"Vendor",
							      L"WISPR");
	}
	::CoUninitialize();

	if (FAILED(hr)) {
		fprintf(stderr, "SpCreateNewTokenEx failed, code %x\n",
			FAILED(hr));
		return FAILED(hr);
	}

	return 0;
}
