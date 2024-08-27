#Requires AutoHotkey v2.0-

#Include "RunFile.ahk"

Commands_ParseLine(line, num) {
	; Argumentless commands go here
	
	args := StrSplit(line, " ", , 2)
	
	Switch args[1] {
		Case "#Exec":
			if args.Length == 2
				RunFile(args[2])
	}
}