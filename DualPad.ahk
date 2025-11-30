;@Ahk2Exe-SetMainIcon icon\teclado-numerico.ico
#NoEnv
#SingleInstance force
SetBatchLines, -1

MostrarBanner := true

BannerExists := false

Sleep, 200
NumLockState := GetKeyState("NumLock", "T")
if (NumLockState) {
    NumLockMode := "NumPad"
} else {
    NumLockMode := "Atajos"
}

~NumLock::
    if (!MostrarBanner)
        return

    Sleep, 100
txt := GetKeyState("NumLock", "T") ? "NumPad" : "Atajos"

    if (!BannerExists) {
        Gui, Banner:+AlwaysOnTop -Caption +ToolWindow +LastFound
        Gui, Banner:Color, 000000
        Gui, Banner:Font, s16 cFFFFFF
        Gui, Banner:Add, Text, w80 +Center vLabelText, %txt%
        WinSet, Transparent, 200
        BannerExists := true
    } else {
        GuiControl, Banner:, LabelText, %txt%
    }

    Gui, Banner:Show, AutoSize x50 y60 NoActivate
    Gui, Banner:+LastFound
    WinSet, AlwaysOnTop, On
    SetTimer, CloseBanner, Off
    SetTimer, CloseBanner, -400
return

CloseBanner:
    Gui, Banner:Hide
return

OnExit, LimpiarRecursos
LimpiarRecursos:
    Gui, Banner:Destroy
    ExitApp

    NumpadHome::F15
    NumpadUp::F16
    NumpadPgUp::F17
    NumpadLeft::F18
    NumpadClear::Volume_Mute
    NumpadRight::F19
    NumpadEnd::Media_Prev
    NumpadDown::Media_Play_Pause
    NumpadPgDn::Media_Next
    NumpadIns::^m

    ; NumpadIns::
    ;     WinGet, proceso, ProcessName, A
    ;     if (proceso = "brave.exe") {
    ;         Send ^m
    ;     } else {
    ;         Send {F20}
    ;     }
    ; return

    NumpadDel::F21
    #If !GetKeyState("NumLock", "T")
        NumpadDiv::F13
    NumpadMult::F14
    NumpadSub::F22
    #If