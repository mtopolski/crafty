#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.15.3 (Beta)
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "UnixTime.au3"


Func ffSend($input)
	ControlSend("FINAL FANTASY XIV", "", "", $input)

	; ~~~SHITTY DEBUG~~~ comment out the above line, uncomment the next ControlSend(),
	; open an untitled Notepad and dirty it up so it has an asterisk in the title.
	;ControlSend("*Untitled - Notepad", "", "Edit1", $input)
EndFunc

Func fromMenuToCraft()
	ffSend("x")
	Sleep(1500)
	ffSend("x")
	Sleep(2500)
EndFunc

Func craft($macro)
	For $i = 0 To Ubound($macro) - 1
		ffSend($macro[$i][0])
		Sleep($macro[$i][1])
	Next
EndFunc

Func foodCheck()
	; initial last monch set, current time - foodTimeLeft
	If $mConf["foodLastMonch"] = 0 Then
		$mConf["foodLastMonch"] = (_TimeGetStamp() - ($mConf["foodTimeLeft"] * 60))
	EndIf

	Local $foodMsLeft = (($mConf["foodTimeLeft"] * 60000) - (_TimeGetStamp() - $mConf["foodLastMonch"]))
	If ($foodMsLeft < ($mConf["foodTimeFloor"] * 60000)) Then
		eatDaFood()
		$mConf["foodLastMonch"] = _TimeGetStamp()
		$mConf["foodTimeLeft"] = $mConf["foodTimeLeft"] + $mConf["foodDuration"]
	EndIf
EndFunc

Func eatDaFood()
	leaveCrafting()
	ffSend($mConf["foodButton"])
	Sleep(4000)
	enterCrafting()
EndFunc

Func leaveCrafting()
	ffSend("n")
	Sleep(3000)
EndFunc

Func enterCrafting()
	ffSend("n")
	Sleep(1000)
	ffSend("x")
	Sleep(1000)
	ffSend("x")
	Sleep(1000)
EndFunc

Func multiCraft($macro, $count)
	Local $craftStartTime = _TimeGetStamp()

	If $mConf["foodManage"] = True Then
		foodCheck()
	EndIf

	For $i = 1 To $count
		fromMenuToCraft()
		craft($macro)
	Next
EndFunc
