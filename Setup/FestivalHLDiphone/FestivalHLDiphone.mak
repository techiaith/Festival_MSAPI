# Microsoft Developer Studio Generated NMAKE File, Based on FestivalHLDiphone.dsp
!IF "$(CFG)" == ""
CFG=FestivalHLDiphone - Win32 Debug
!MESSAGE No configuration specified. Defaulting to FestivalHLDiphone - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "FestivalHLDiphone - Win32 Debug" && "$(CFG)" != "FestivalHLDiphone - Win32 Unicode Debug" && "$(CFG)" != "FestivalHLDiphone - Win32 Release MinSize" && "$(CFG)" != "FestivalHLDiphone - Win32 Release MinDependency" && "$(CFG)" != "FestivalHLDiphone - Win32 Unicode Release MinSize" && "$(CFG)" != "FestivalHLDiphone - Win32 Unicode Release MinDependency"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "FestivalHLDiphone.mak" CFG="FestivalHLDiphone - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "FestivalHLDiphone - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "FestivalHLDiphone - Win32 Unicode Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "FestivalHLDiphone - Win32 Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "FestivalHLDiphone - Win32 Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "FestivalHLDiphone - Win32 Unicode Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "FestivalHLDiphone - Win32 Unicode Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "FestivalHLDiphone - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" "$(OUTDIR)\FestivalHLDiphone.pch" ".\Debug\regsvr32.trg"

!ELSE 

ALL : "FestivalClient - Win32 Debug" "FestivalTTSEngine - Win32 Debug" "$(OUTDIR)\FestivalHLDiphone.dll" "$(OUTDIR)\FestivalHLDiphone.pch" ".\Debug\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"FestivalTTSEngine - Win32 DebugCLEAN" "FestivalClient - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.ilk"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase "$(OUTDIR)\FestivalHLDiphone.pdb"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\Debug\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib wsock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /debug /machine:I386 /nodefaultlib:"libcd.lib" /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" /pdbtype:sept 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res" \
	"..\FestivalTTSEngine\Debug\FestivalTTSEngine.lib" \
	"..\FestivalClient\Debug\FestivalClient.lib"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\Debug
TargetPath=.\Debug\FestivalHLDiphone.dll
InputPath=.\Debug\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Debug"

OUTDIR=.\DebugU
INTDIR=.\DebugU
# Begin Custom Macros
OutDir=.\DebugU
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\DebugU\regsvr32.trg"

!ELSE 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\DebugU\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.ilk"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase "$(OUTDIR)\FestivalHLDiphone.pdb"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\DebugU\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /debug /machine:I386 /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" /pdbtype:sept 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\DebugU
TargetPath=.\DebugU\FestivalHLDiphone.dll
InputPath=.\DebugU\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end 
<< 
	

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinSize"

OUTDIR=.\ReleaseMinSize
INTDIR=.\ReleaseMinSize
# Begin Custom Macros
OutDir=.\ReleaseMinSize
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseMinSize\regsvr32.trg"

!ELSE 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseMinSize\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\ReleaseMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /machine:I386 /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinSize
TargetPath=.\ReleaseMinSize\FestivalHLDiphone.dll
InputPath=.\ReleaseMinSize\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinDependency"

OUTDIR=.\ReleaseMinDependency
INTDIR=.\ReleaseMinDependency
# Begin Custom Macros
OutDir=.\ReleaseMinDependency
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseMinDependency\regsvr32.trg"

!ELSE 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseMinDependency\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.ilk"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\ReleaseMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /machine:I386 /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinDependency
TargetPath=.\ReleaseMinDependency\FestivalHLDiphone.dll
InputPath=.\ReleaseMinDependency\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinSize"

OUTDIR=.\ReleaseUMinSize
INTDIR=.\ReleaseUMinSize
# Begin Custom Macros
OutDir=.\ReleaseUMinSize
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseUMinSize\regsvr32.trg"

!ELSE 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" ".\ReleaseUMinSize\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\ReleaseUMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /machine:I386 /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinSize
TargetPath=.\ReleaseUMinSize\FestivalHLDiphone.dll
InputPath=.\ReleaseUMinSize\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end 
<< 
	

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinDependency"

OUTDIR=.\ReleaseUMinDependency
INTDIR=.\ReleaseUMinDependency
# Begin Custom Macros
OutDir=.\ReleaseUMinDependency
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" "$(OUTDIR)\FestivalHLDiphone.pch" ".\ReleaseUMinDependency\regsvr32.trg"

!ELSE 

ALL : "$(OUTDIR)\FestivalHLDiphone.dll" ".\FestivalHLDiphone.tlb" ".\FestivalHLDiphone.h" ".\FestivalHLDiphone_i.c" "$(OUTDIR)\FestivalHLDiphone.pch" ".\ReleaseUMinDependency\regsvr32.trg"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\FestivalHLDiphone.obj"
	-@erase "$(INTDIR)\FestivalHLDiphone.pch"
	-@erase "$(INTDIR)\FestivalHLDiphone.res"
	-@erase "$(INTDIR)\FestivalHLDiphoneObj.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\FestivalHLDiphone.dll"
	-@erase "$(OUTDIR)\FestivalHLDiphone.exp"
	-@erase "$(OUTDIR)\FestivalHLDiphone.ilk"
	-@erase "$(OUTDIR)\FestivalHLDiphone.lib"
	-@erase ".\FestivalHLDiphone.h"
	-@erase ".\FestivalHLDiphone.tlb"
	-@erase ".\FestivalHLDiphone_i.c"
	-@erase ".\ReleaseUMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\FestivalHLDiphone.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FestivalHLDiphone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib sapi.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\FestivalHLDiphone.pdb" /machine:I386 /def:".\FestivalHLDiphone.def" /out:"$(OUTDIR)\FestivalHLDiphone.dll" /implib:"$(OUTDIR)\FestivalHLDiphone.lib" 
DEF_FILE= \
	".\FestivalHLDiphone.def"
LINK32_OBJS= \
	"$(INTDIR)\FestivalHLDiphone.obj" \
	"$(INTDIR)\FestivalHLDiphoneObj.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\FestivalHLDiphone.res"

"$(OUTDIR)\FestivalHLDiphone.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinDependency
TargetPath=.\ReleaseUMinDependency\FestivalHLDiphone.dll
InputPath=.\ReleaseUMinDependency\FestivalHLDiphone.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end 
<< 
	

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL_PROJ=

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("FestivalHLDiphone.dep")
!INCLUDE "FestivalHLDiphone.dep"
!ELSE 
!MESSAGE Warning: cannot find "FestivalHLDiphone.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "FestivalHLDiphone - Win32 Debug" || "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Debug" || "$(CFG)" == "FestivalHLDiphone - Win32 Release MinSize" || "$(CFG)" == "FestivalHLDiphone - Win32 Release MinDependency" || "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinSize" || "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinDependency"
SOURCE=.\FestivalHLDiphone.cpp

"$(INTDIR)\FestivalHLDiphone.obj" : $(SOURCE) "$(INTDIR)" ".\FestivalHLDiphone_i.c" ".\FestivalHLDiphone.h"


SOURCE=.\FestivalHLDiphone.idl
MTL_SWITCHES=/tlb ".\FestivalHLDiphone.tlb" /h "FestivalHLDiphone.h" /iid "FestivalHLDiphone_i.c" /Oicf 

".\FestivalHLDiphone.tlb"	".\FestivalHLDiphone.h"	".\FestivalHLDiphone_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


SOURCE=.\FestivalHLDiphone.rc

"$(INTDIR)\FestivalHLDiphone.res" : $(SOURCE) "$(INTDIR)" ".\FestivalHLDiphone.tlb"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\FestivalHLDiphoneObj.cpp

"$(INTDIR)\FestivalHLDiphoneObj.obj" : $(SOURCE) "$(INTDIR)" ".\FestivalHLDiphone.h"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "FestivalHLDiphone - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\FestivalHLDiphone.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\FestivalHLDiphone.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

!IF  "$(CFG)" == "FestivalHLDiphone - Win32 Debug"

"FestivalTTSEngine - Win32 Debug" : 
   cd "\Dev\WISPR\Local Copy\Festival_MSAPI\FestivalTTSEngine"
   $(MAKE) /$(MAKEFLAGS) /F ".\FestivalTTSEngine.mak" CFG="FestivalTTSEngine - Win32 Debug" 
   cd "..\FestivalHLDiphone"

"FestivalTTSEngine - Win32 DebugCLEAN" : 
   cd "\Dev\WISPR\Local Copy\Festival_MSAPI\FestivalTTSEngine"
   $(MAKE) /$(MAKEFLAGS) /F ".\FestivalTTSEngine.mak" CFG="FestivalTTSEngine - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\FestivalHLDiphone"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Debug"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinSize"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinDependency"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinSize"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinDependency"

!ENDIF 

!IF  "$(CFG)" == "FestivalHLDiphone - Win32 Debug"

"FestivalClient - Win32 Debug" : 
   cd "\Dev\WISPR\Local Copy\Festival_MSAPI\FestivalClient"
   $(MAKE) /$(MAKEFLAGS) /F ".\FestivalClient.mak" CFG="FestivalClient - Win32 Debug" 
   cd "..\FestivalHLDiphone"

"FestivalClient - Win32 DebugCLEAN" : 
   cd "\Dev\WISPR\Local Copy\Festival_MSAPI\FestivalClient"
   $(MAKE) /$(MAKEFLAGS) /F ".\FestivalClient.mak" CFG="FestivalClient - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\FestivalHLDiphone"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Debug"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinSize"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Release MinDependency"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinSize"

!ELSEIF  "$(CFG)" == "FestivalHLDiphone - Win32 Unicode Release MinDependency"

!ENDIF 


!ENDIF 

