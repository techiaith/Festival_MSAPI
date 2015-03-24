
FestivalHLDiphoneps.dll: dlldata.obj FestivalHLDiphone_p.obj FestivalHLDiphone_i.obj
	link /dll /out:FestivalHLDiphoneps.dll /def:FestivalHLDiphoneps.def /entry:DllMain dlldata.obj FestivalHLDiphone_p.obj FestivalHLDiphone_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del FestivalHLDiphoneps.dll
	@del FestivalHLDiphoneps.lib
	@del FestivalHLDiphoneps.exp
	@del dlldata.obj
	@del FestivalHLDiphone_p.obj
	@del FestivalHLDiphone_i.obj
