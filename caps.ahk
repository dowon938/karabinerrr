#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

+Insert::Volume_Mute
+PgUp::Volume_Up
+PgDn::Volume_Down
!<4::!F4

Insert::Home
>+Esc::~

*CapsLock:: sgn := 1
*CapsLock up:: sgn := 0
#if sgn
j::Key("left")
k::Key("down")
i::Key("up")
l::Key("right")
m::Del
n::BS
`;::end

;;;;;;;;;;;;;;;;;;;;글자블럭잡기: shift+방향키조합;;;;;;;;;;;;;;;;;;;;
<+j:: 
Send, {Shift down}{left}
return

<+k:: 
Send, {Shift down}{down}
return

<+i:: 
Send, {Shift down}{up}
return

<+l:: 
Send, {Shift down}{right}
return
;;;;;;;;;;;;;;;;;;;;글자단어단위이동: ctrl+방향키조합;;;;;;;;;;;;;;;;;;;;
<^j:: 
Send, ^{left}
return

<^l:: 
Send, ^{right}
return
;;;;;;;;;;;;;;;;;;;;글자블럭단어단위: ctrl+shift 방향키조합;;;;;;;;;;;;;;;;;;;
<^<+j:: 
Send, ^+{left}
return

<^<+l:: 
Send, ^+{right}
return
;;;;;;;;;;;;;;;;;;;;글자블럭단어단위: alt+shift 방향키조합;;;;;;;;;;;;;;;;;;;
<+!<i:: 
Send, +!{up}
return

<+!<k:: 
Send, +!{down}
return
;;;;;;;;;;;;;;;;;;;;글자블럭단어단위: alt 방향키조합;;;;;;;;;;;;;;;;;;;
!<i:: 
Send, !{up}
return

!<k:: 
Send, !{down}
return
;;;;;;;;;;;;;;;;;;;;글자블럭단어단위: ctrl+alt 방향키조합;;;;;;;;;;;;;;;;;;;
<^!<i:: 
Send, ^!{up}
return

<^!<k:: 
Send, ^!{down}
return

<^!<j:: 
Send, ^!{left}
return

<^!<l:: 
Send, ^!{right}
return

#if
Key(key)
{
SendInput {blind}{%key%}
}
Key_repeat(pfx, key)
{
SendInput {blind}%pfx%{%key%}
}
 
<^LWin::
GetKeyState, cstate, capslock, T
if cstate = U
SetCapslockState, On
if cstate = D
SetCapslockState, Off
return