#Requires AutoHotkey v2.0-

; File name
filename := "tas.ahktas"

#Include "RunFile.ahk"

^P::{
	RunFile(filename)
	;MsgBox "Done!"
}
^O::{
	MsgBox "Closing..."
	ExitApp
}