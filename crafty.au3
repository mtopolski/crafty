#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.15.3 (Beta)
 Author: The Japes

 Script Function:
	To be better than Enpfeff

#ce ----------------------------------------------------------------------------
; Own the Libs
#include "UnixTime.au3"
#include "common.au3"

; MACROS
; provide macros in tuples of [keypress, timeToWaitInMilliseconds]
Local $a35DurHQ = [[9, 42000], [0, 18000]]
Local $a35DurSmush = [["=", 18000]]

; CONFIG
Global $mConf[]
$mConf["macro"] = $a35DurHQ
$mConf["count"] = 20
; just food things
$mConf["foodManage"] = False
$mConf["foodTimeLeft"] = 0 ; in minutes
$mConf["foodDuration"] = 40 ; in minutes
$mConf["foodButton"] = 8
$mConf["foodTimeFloor"] = 2 ; in minutes (how low to let food get)
$mConf["foodLastMonch"] = 0 ; don't touch this, piggybacking on global

; WHAT ARE WE ACTUALLY DOING
multiCraft($mConf["macro"], $mConf["count"])

