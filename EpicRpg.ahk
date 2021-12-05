#NoEnv
;#Warn
#SingleInstance, Force
#NoTrayIcon
;#MaxThreadsPerHotkey, 2
#KeyHistory, 2
ListLines Off
;SetBatchLines, -1
;SetKeyDelay, -1, -1
;SetMouseDelay, -1
;SetWinDelay, -1
;SetControlDelay, -1
SendMode Input
SetWorkingDir %A_ScriptDir%
;CoordMode, ToolTip, Screen
;Görev Düğmeleri !alt +shift ^ctrl #Win 

;değişkenler buradan değiştireceksin aramadan
;script çalışırkende ilgili tuşa shiftle bas shift numped 5 gibi
;ascended 
Huntt := "ascended hunt h t"
Hunt := "ascended hunt h"
Adv := "adv"
Work := "ascended chainsaw"
Farm := "farm"

PetTrv := "c"
PetId1 := "e" , PetAdv1 := "find"	;epic pet
PetId2 := "c" , PetAdv2 := "find"

;Kendi Özel Değişkenlerim
Kontrol1 := "0"		;0 ise yapıştır,1 ise enter olacak sol tekerlek eğim.
kHuntS := "0" 		;Auto hunt kontrol
tHuntS := "0" 		;menutoogle
winid :=  ""		;sonaktif pencere exesi
winname := "msedge.exe"	;msedge.exe/opera.exe
GoSub Randomize		;rSleepM,rSleepL,rSleepH mikro düşük ve büyük gecikmeler

;Menu yapıyoruz
Menu, Tray, Icon, imageres.dll, 251
Menu, Tray, Tip, Alper
Menu, Tray, NoStandard
Menu, Tray, Click, 2

;Ayarlar menüsünü yapıyoruz
Menu, mAyar, Add, Hunt t Ayarla, HunttAyar
Menu, mAyar, Add, Hunt Ayarla, HuntAyar
Menu, mAyar, Add, Adv Ayarla, AdvAyar
Menu, mAyar, Add, Work Ayarla, WorkAyar
Menu, mAyar, Add, Farm Ayarla, FarmAyar

Menu, mAyar, Icon, Hunt t Ayarla, Shell32.dll, 138
Menu, mAyar, Icon, Hunt Ayarla, Shell32.dll, 138
Menu, mAyar, Icon, Adv Ayarla, Shell32.dll, 138
Menu, mAyar, Icon, Work Ayarla, Shell32.dll, 138
Menu, mAyar, Icon, Farm Ayarla, Shell32.dll, 138

Menu, Tray, Add, OtoHunt, Ahuntmenuonoff
Menu, Tray, Add
Menu, Tray, Add, Ayarlar, :mAyar
Menu, Tray, Add
Menu, Tray, Add, Info, Info
Menu, Tray, Add, Suspend, Suspend
Menu, Tray, Add, Çıkış, Exit

Menu, Tray, Icon, OtoHunt, imageres.dll, 82
Menu, Tray, Icon, Ayarlar, imageres.dll, 65
Menu, Tray, Icon, Info, imageres.dll, 243
Menu, Tray, Icon, Suspend, Shell32.dll, 266
Menu, Tray, Icon, Çıkış, setupapi.dll, 10
Menu, Tray, Default, 1&
Menu, Tray, Icon

;kelime tamamlayıcılar sonlandırıcı (Space nokta enter)
;:*:mb::n
::r::rpg
::rhb::rpg horse breed
::rd::rpg duel
::ra::rpg ascended

;kelime göndericiler anında gönderir
:*:rda::
Send, rpg daily
Send, {Enter}
Return

:*:rdr::
Send, rpg drink
Send, {Enter}
Return

:*:rew::
Send, rpg event
Send, {Enter}
Return

:*:rw::
Send, rpg world
Send, {Enter}
Return

:*:req::
Send, rpg ascended not so mini boss
Send, {Enter}
Sleep, %rSleepL%
Send, rpg ascended big arena
Send, {Enter}
Return

:*:rq::
Send, rpg quest
Send, {Enter}
Return


:*:rbe::
Send, rpg buy ed lb
Send, {Enter}
Return

::rdisall::
Send, rpg dismantle epic fish all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg dismantle golden fish all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg dismantle hyper log all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg dismantle mega log all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg dismantle super log all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg dismantle epic log all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg dismantle banana all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg trade e all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg trade c all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg trade a all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg i
Send, {Enter}
GoSub Randomize
Return

::ropall::
Send, rpg open ed all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg open ep all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg open r all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg open u all
	Send, {Enter}
	Sleep, %rSleepH%
Send, rpg open c all
Send, {Enter}
Sleep, %rSleepH%
	Send, rpg i
	Send, {Enter}
GoSub Randomize
Return

;Kısayollar Numlock açıkken 
NumpadIns::	;Numpad0
Send, rpg Hunt
Sleep, %rSleepM%
Send, {Enter}
keywait, NumpadIns
return

+NumpadIns::	;Shift+Numpad0
Send, rpg farm carrot
Sleep, %rSleepM%
Send, {Enter}
keywait, NumpadIns
return

^NumpadIns::  Winset, Alwaysontop, , A

Ahuntt:
NumpadEnd::	;Numpad1
;/*
Send, rpg heal
Sleep, %rSleepM%
Send, {Enter}
Sleep, %rSleepL%
;*/
	GoSub Randomize
	Send, rpg %Huntt%
	Sleep, %rSleepM%
	Send, {Enter}
	keywait, NumpadEnd
return

HunttAyar:
+NumpadEnd::	;Shift+Numpad1
tmpHuntt :=Huntt
	InputBox, Huntt, Hunt Together Komutunu giriniz, hunt t gibi, , 250, 125, , , , , hunt t
if ErrorLevel
    Huntt :=tmpHuntt
else
    MsgBox, Hunt Together komutu: "%Huntt%"`nolarak değiştirildi. 
return

^NumpadEnd::	;Ctrl+Numpad1
	Send, rpg pet adventure claim
	Send, {Enter}
	Sleep, %rSleepL%
	Send, rpg pet adventure learn b
	Send, {Enter}
keywait, NumpadEnd
return

Ahunt:
NumpadDown::	;Numpad2
;/*
Send, rpg heal
Sleep, %rSleepM%
Send, {Enter}
Sleep, %rSleepL%
;*/
	Send, rpg %Hunt%
	Sleep, %rSleepM%
	Send, {Enter}
	keywait, NumpadDown
return

HuntAyar:
+NumpadDown::	;Shift+Numpad2
tmpHunt :=Hunt
	InputBox, Hunt, Hunt Komutunu giriniz, hunt gibi, , 250, 125, , , , , hunt
if ErrorLevel
    Hunt :=tmpHunt
else
    MsgBox, Hunt komutu: "%Hunt%"`nolarak değiştirildi. 
return

NumpadPgDn::	;Numpad3
	Send, rpg %Adv%
	Send, {Enter}
	keywait, NumpadPgDn
return

AdvAyar:
+NumpadPgDn::	;Shift+Numpad3
tmpAdv :=Adv
	InputBox, Adv, Advenced Komutunu giriniz, adv h gibi, , 250, 125, , , , , adv
if ErrorLevel
    Adv :=tmpAdv
else
    MsgBox, Advenced komutu: "%Adv%"`nolarak değiştirildi. 
return

Awork:
NumpadLeft::	;Numpad4 
	Send, rpg %Work%
	Sleep, %rSleepM%
	Send, {Enter}
	keywait, NumpadLeft
return

WorkAyar:
+NumpadLeft::	;Shift+Numpad4 
tmpWork :=Work
	InputBox, Work, Work Komutunu giriniz, chop gibi, , 250, 125, , , , , chop
if ErrorLevel
    Work :=tmpWork
else
    MsgBox, Work komutu: "%Work%"`nolarak değiştirildi.
return

Afarm:
NumpadClear::	;Numpad5 
	Send, rpg %Farm%
	Sleep, %rSleepM%
	Send, {Enter}
	keywait, NumpadClear
return

FarmAyar:
+NumpadClear::	;Shift+Numpad5 
tmpFarm :=Farm
InputBox, Farm, Farm Komutunu giriniz, farm carrot gibi, , 250, 125, , , , , farm
if ErrorLevel
    Farm :=tmpFarm
else
    MsgBox, Farm komutu: "%Farm%"`nolarak değiştirildi.
return

NumpadRight::	;Numpad6 
	Send, rpg tr
	Send, {Enter}
	keywait, NumpadRight
return

NumpadHome::	;Numpad7
	Send, rpg rd
	Send, {Enter}
	keywait, NumpadHome
return

NumpadUp::	;Numpad8
	Send, rpg cd
	Send, {Enter}
	keywait, NumpadUp
return

NumpadPgUp::	;Numpad9 
	Send, rpg pet adventure claim
	Send, {Enter}
	Sleep, %rSleepL%
	Send, rpg pet adventure %PetAdv2% %PetId2%
	Send, {Enter}
	GoSub Randomize
keywait, NumpadPgUp
return

+NumpadPgUp::	;Shift+Numpad9 
	Send, rpg pet adventure claim
	Send, {Enter}
	Sleep, %rSleepL%
	Send, rpg pet adventure %PetAdv1% %PetId1%
	Send, {Enter}
	GoSub Randomize
keywait, NumpadPgUp
return

^NumpadPgUp::	;Ctrl+Numpad9 
	Send, rpg pet tournament %PetTrv%
	Send, {Enter}
keywait, NumpadPgUp
return

;Etiketlerim   

Suspend:
Menu, Tray, ToggleCheck, Suspend
Suspend
Return

Exit:
ExitApp
Return

Randomize:
Random rSleepM, 50, 99
Random rSleepL, 1400, 1700
Random rSleepH, 2200, 2800
Return

Timers:
SetTimer, AfarmStart, 415517
SetTimer, AworkStart, 212289
SetTimer, AhuntStart, 41000
SetTimer, AotoStop, 1800000
return

AworkStart:
GoSub FirstAktif
Gosub Awork
Sleep, %rSleepL%
Gosub LastAktif
return

AfarmStart:
GoSub FirstAktif
Gosub Afarm
Sleep, %rSleepL%
Gosub LastAktif
return

AhuntStart:
GoSub FirstAktif

if (kHuntS ="0")
GoSub Ahuntt
else 
Gosub Ahunt
kHuntS := !kHuntS
Sleep, %rSleepL%
Gosub LastAktif
return

AotoStop:
SetTimer, AfarmStart, Off
SetTimer, AworkStart, Off
SetTimer, AhuntStart, Off
SetTimer, AotoStop, Off
kHuntS := "0"
tHuntS := "0"
Menu, Tray, UnCheck, OtoHunt
Menu, Tray, Icon, imageres.dll, 251
return

Ahuntmenuonoff:
if (tHuntS = "0") {
Menu, Tray, Check, OtoHunt
Menu, Tray, Icon, imageres.dll, 82
tHuntS := !tHuntS
GoSub Timers
}
Else
GoSub AotoStop
return

FirstAktif:
Sleep, %rSleepM%
WinGet, winid, ProcessName, A
WinActivate, ahk_exe %winname%
WinWait, ahk_exe %winname%
return

LastAktif:
Sleep, %rSleepM%
WinActivate, ahk_exe %winid%
WinWait, ahk_exe %winid%
return

;Çift Tıklanan tuşlar

~Ctrl up::
    if (A_PriorKey == "LControl" && A_ThisHotkey == A_PriorHotkey && A_TimeSincePriorHotkey < 500) {
        Run, C:\Windows\System32\calc.exe
    }
Return

;Mause Yapılandırması

WheelLeft::
tmpClipboard = %Clipboard%
Send, ^c
Sleep, 20
	If (tmpClipboard = Clipboard)
Clipboard := ""
	Else
	Kontrol1 := "0"
Return

WheelRight::
If (ClipBoard) {
	if (Kontrol1 = "0")
	Send, ^v
	if (Kontrol1 = "1")
	Send, {Enter}
}
else ; If null
Send, {Enter}
Kontrol1 := !Kontrol1
Return

~LShift & WheelLeft::    ; Scroll left.
    ControlGetFocus, fcontrol, A
    Loop 10    ; <-- Hızlandırmak için değeri arttır
        SendMessage, 0x114, 0, 0, %fcontrol%, A  ; WM_HSCROLL, SB_LINELEFT, 0
Return

~LShift & WheelRight::  ; Scroll right.
    ControlGetFocus, fcontrol, A
    Loop 10    ; <-- Hızlandırmak için değeri arttır
        SendMessage, 0x114, 1, 0, %fcontrol%, A  ; WM_HSCROLL, SB_LINERIGHT, 0
Return

;2tarayıcı açıkken ve heartstone açık değilken
#If WinExist("ahk_exe msedge.exe") and WinExist("ahk_exe opera.exe") and !WinExist("ahk_exe Hearthstone.exe")

XButton2::
if WinActive("ahk_exe opera.exe") {
WinActivate, ahk_exe msedge.exe
WinWait, ahk_exe msedge.exe
return
}
if WinActive("ahk_exe msedge.exe") {
WinActivate, ahk_exe opera.exe
WinWait, ahk_exe opera.exe
return
}
 Send, {XButton2}
return

;heartstone açıkken
#If WinExist("ahk_exe Hearthstone.exe")

MButton::#d

XButton2::
if WinActive("ahk_exe " winname) {
WinActivate, ahk_exe Hearthstone.exe
WinWait, ahk_exe Hearthstone.exe
}
Else {
WinActivate ahk_exe %winname%
WinWait ahk_exe %winname%
}
return

#If	;normale dön

; Bilgi tooltip
Info:
^+a::	;ctrl+shift+a
    Tooltip,
(
Tamamlanan kelimeler
r	rpg
rhb	rpg horse breed
rd	rpg duel

Anında gönderilen kelimeler
rda	rpg daily
rdr	rpg drink
rew	rpg event
rw	rpg world
req	eventleri gösterir
rq	rpg quest
rbe	rpg buy ed lb

--Komutlar--
rdisall
ropall
--shift+numpadx--
Ayarlara erişim

Trayicona çift tıklama
Otohuntu aç/kapa
Ctrl+Shift+a bu

Herzaman :
Tekerlek Eğ:Gelişmiş kopyala yapıştır
Shift Tekerlek Eğ: Yatay Kaydırma
Çift Ctrl: Hesap Makinesi
Ctrl+Numpad0: Always on Top

Heartstone :
Mause 1 Edge/Hs ön plana getirir.
), 0, 0
    Sleep, 10000
    ToolTip
Return