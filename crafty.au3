#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: The Japes

 Script Function:
	To be better than Enpfeff

#ce ----------------------------------------------------------------------------
; MACROS
; provide macros in tuples of [keypress, timeToWaitInMilliseconds]
Local $a35DurHQ = [[9, 42000], [0, 18000]]
Local $a35DurSmush = [[=, 18000]] 


; CONFIG
Local $mConf[]
$mConf["macro"] = $a35DurHQ
$mConf["count"] = 20


; SLOPPY JALOPPY
Func ffSend($input)
	ControlSend("FINAL FANTASY XIV", "", "", $input)

	; ~~~SHITTY DEBUG~~~ comment out the above line, uncomment the next ControlSend(),
	; open an untitled Notepad and dirty it up so it has an asterisk in the title.
	;ControlSend("*Untitled - Notepad", "", "Edit1", $input)
EndFunc

Func fromMenuToCraft()
	ffSend("x")
	Sleep(1000)
	ffSend("x")
	Sleep(2500)
EndFunc

Func craft($macro)
	For $i = 0 To Ubound($macro) - 1
		ffSend($macro[$i][0])
		Sleep($macro[$i][1])
	Next
EndFunc

Func multiCraft($macro, $count)
	For $i = 1 To $count
		fromMenuToCraft()
		craft($macro)
	Next
EndFunc

multiCraft($mConf["macro"], $mConf["count"])
