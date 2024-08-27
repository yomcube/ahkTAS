#Requires AutoHotkey v2.0-

#Include "Commands.ahk"

ExecLine(line, num) {
	; Parse commands
	if SubStr(line, 1, 1) == "#" {
		Commands_ParseLine(line, num)
		Return
	}
	
	; Split line
	split := StrSplit(line, A_Tab)
	if split.Length == 1 {
		Sleep split[1]
		Return
	}
	
	sendstr := ""
	unsendstr := ""
	
	Loop Parse, split[2], "," {
		isClick := InStr(A_LoopField, "Click", false, 1)
		if isClick {
			sendstr .= "{" A_LoopField "}"
		}
		else {
			sendstr .= "{" Trim(A_LoopField) " down}"
			unsendstr .= "{" Trim(A_LoopField) " up}"
		}
	}
	Send sendstr
	Sleep split[1]
	Send unsendstr
}

RunFile(tasfile) {
	; Check if the file exists
	if not FileExist(tasfile) {
		MsgBox "``" tasfile "`` does not exist."
		Return
	}

	; Read file
	contents := FileRead(tasfile)

	; Parse each line
	Loop Parse contents, "`n", "`r" {
		l := A_LoopField
		
		; Remove comments
		if InStr(l, ";") {
			l := StrSplit(l, ";")[1]
		}
		
		; Trim whitespace
		l := Trim(l)
		
		; Skip empty lines
		if l == ""
			Continue
		
		; Other execute logic
		ExecLine(l, A_Index)
	}
}
