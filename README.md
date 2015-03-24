# Festival_MSAPI

Integreiddio testun i leferydd Festival i Windows drwy MSAPI 

Integrate Festival TTS into Windows via MSAPI

##Background
This repository contains the code that added a Windows MSAPI interface to the Festival Speech Synthesis system. The
interface was successfully used to provide the first versions of Welsh language text to speech in Windows XP back in 2006.

Unfortunately, not much work has followed in maintaining the code so as to maintain compatibility and support for newer versions of
Microsoft Windows. 

**WARNING**: the code is provided here in case it may still be of interest to other developers who wish to add text to speech 
for their languages into Microsoft Windows. We also hope very much that others may fork and update this
code for Windows 7/8 or even 10!

## Setup
The Setup directory contains a further Visual Studio solution for constructing the installer / MSI file. The directory contains all the contents that go into the installer, including merge modules, dlls and other binaries as well as the Welsh voice(s) data.


## In the meantime.....
In the meantime our efforts at techiaith are focused on Festival on Linux/Raspberry Pis and the cloud. We now provide
Festival's Welsh language voices via on online API (see https://github.com/PorthTechnolegauIaith/festival). We also have 
a Python C wrapper for Festival - (see https://github.com/techiaith/pyfestival)

