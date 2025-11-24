;@Ahk2Exe-SetMainIcon icon\icon.ico ; selecciona el icono
#NoEnv
#SingleInstance force
SetBatchLines, -1

MostrarBanner := true  ; true = mostrar banner | false = ocultar banner

BannerExists := false

Sleep, 200
NumLockState := GetKeyState("NumLock", "T")
if (NumLockState) {
    NumLockMode := "NumPad"
} else {
    NumLockMode := "Atajos"
}

~NumLock::
    if (!MostrarBanner)  ; Si el banner está desactivado, salir inmediatamente
        return
    
    Sleep, 100
    txt := GetKeyState("NumLock", "T") ? "NumPad" : "Atajos"
    
    if (!BannerExists) {
        Gui, Banner:+AlwaysOnTop -Caption +ToolWindow +LastFound
        Gui, Banner:Color, 000000
        Gui, Banner:Font, s16 cFFFFFF, Monocraft
        Gui, Banner:Add, Text, +Center vLabelText, %txt%
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

NumpadHome::F15                 ; 7      --->      F15
NumpadUp::F16                   ; 8      --->      F16
NumpadPgUp::F17                 ; 9      --->      F17
NumpadLeft::F18                 ; 4      --->      F18
NumpadClear::Volume_Mute        ; 5      --->      Mute
NumpadRight::F19                ; 6      --->      F19
NumpadEnd::Media_Prev           ; 1      --->      Anterior
NumpadDown::Media_Play_Pause    ; 2      --->      Play / Pausa
NumpadPgDn::Media_Next          ; 3      --->      Siguiente
NumpadIns::F20			; 0	 --->	   F20	
;NumpadIns::
;    WinGet, proceso, ProcessName, A
;    if (proceso = "brave.exe") {
;        Send ^m
;    } else {
;        Send {F20}
;    }
;return

NumpadDel::F21                  ; .      --->      F21

#If !GetKeyState("NumLock", "T")
    NumpadDiv::F13               ; /      --->      F13
    NumpadMult::F14              ; *      --->      F14
    NumpadSub::F22               ; -      --->      F22
#If