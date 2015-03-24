// FestivalHLDiphoneObj.h : Declaration of the CFestivalHLDiphoneObj

#ifndef __FESTIVALHLDIPHONEOBJ_H_
#define __FESTIVALHLDIPHONEOBJ_H_

#include "resource.h"       // main symbols
#include "..\\FestivalTTSEngine\\FestivalTTSEngineObj.h"


/////////////////////////////////////////////////////////////////////////////
// CFestivalHLDiphoneObj
class ATL_NO_VTABLE CFestivalHLDiphoneObj : 
	public CComCoClass<CFestivalHLDiphoneObj, &CLSID_FestivalHLDiphoneObj>,
	public CFestivalTTSEngineObj
{
public:
	
    DECLARE_REGISTRY_RESOURCEID(IDR_FESTIVALHLDIPHONEOBJ)
    DECLARE_PROTECT_FINAL_CONSTRUCT()
    BEGIN_COM_MAP(CFestivalHLDiphoneObj)
	    COM_INTERFACE_ENTRY(ISpTTSEngine)
	    COM_INTERFACE_ENTRY(ISpObjectWithToken)
    END_COM_MAP()

public:
	CFestivalHLDiphoneObj()
	{
	}

	~CFestivalHLDiphoneObj()
	{
		/* may need to clean up on destruction */
	}
};
#endif //__FESTIVALHLDIPHONEOBJ_H_
