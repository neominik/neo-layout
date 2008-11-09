/* SHORTCUTS
   Da in diesem AHK-Skript s�mtliche Tastendr�cke zur weiteren Verarbeitung
   in Unicode- und Spezialzeichen umgewandelt werden, m�ssen sie f�r eine
   effiziente Tasten-Ausgabe, wo m�glich, zur�ck gewandelt werden. Dazu
   dienen Shortcuts: Soll beispielsweise das Unicode-Zeichen U0061 (kleines
   a) ausgegeben werden, muss dieses durch "send {a}" ersetzt werden. Die
   daf�r notwendigen R�ckwandlungskonstanten werden hier, teilweise
   automatisiert, definiert und im entsprechenden Unterprogramm zur Anwendung
   gebracht.
*/

; ###### Shortcuts f�r alle ASCII-Zeichen (0x21 bis 0x7E)
SetFormat, integer, hex
char := 0x21
loop {
  s1 := SubStr(char,3)
  CSU00%s1% := chr(char)
  char += 1
  if (char = 0x7E)
    break
}
SetFormat, integer, d

; #### weitere Shortcuts
CSU0008 := "Backspace"
CSU0009 := "tab"
CSU000D := "Enter"
CSU001B := "esc"
CSU0020 := "space"

/**** die folgenden Shortcuts ersetzen die automatische Wahl entsprechender
 **** down- und up-Sendezeichen, da die Zeichenerzeugung entweder aufw�ndiger
 **** ist (wie bei den diversen toten Zeichen) oder schlicht mit AHK nicht
 **** geht (wie das Key-Repeat der schlie�enden Klammer).
*/
DNCSU005E := "{^}{space}"
DNCSU0060 := "{``}{space}"
DNCSU007D := "{}}"                 ; "{} down}" geht nicht, warum auch immer
DNCSU00B4 := "{�}{space}"
UNSHU00B4 := 1

/**** die meisten der folgenden Shortcuts werden von AHK zwar verarbeitet,
 **** von dort aber nur als ALT+Numpad verschickt und daher nicht f�r alle
 **** Programme nutzbar, also auskommentiert und als Unicode-Zeichen
 **** geschickt.
*/
CSU20AC := chr(128)   ; �
UNSHU20AC := 1
; CSU201A := chr(130) ; �
; CSU0192 := chr(131) ; �
; CSU201E := chr(132) ; �
; CSU2026 := chr(133) ; �
; CSU2020 := chr(134) ; �
; CSU2021 := chr(135) ; �
; CSU02C6 := chr(136) ; �
; CSU2030 := chr(137) ; �
; CSU0160 := chr(138) ; �
; CSU2039 := chr(139) ; �
; CSU0152 := chr(140) ; �
; CSU017D := chr(142) ; �
; CSU2018 := chr(145) ; �
; CSU2019 := chr(146) ; �
; CSU201C := chr(147) ; �
; CSU201D := chr(148) ; �
; CSU2022 := chr(149) ; �
; CSU2013 := chr(150) ; �
; CSU2014 := chr(151) ; �
; CSU02DC := chr(152) ; �
; CSU2122 := chr(153) ; �
; CSU0161 := chr(154) ; �
; CSU203A := chr(155) ; �
; CSU0153 := chr(156) ; �
; CSU017E := chr(158) ; �
; CSU0178 := chr(159) ; �
CSU00A7 := chr(167)   ; �
CSU00B0 := chr(176)   ; �
CSU00B2 := chr(178)   ; �
CSU00B3 := chr(179)   ; �
; CSU00B4 := chr(180)   ; �
CSU00B5 := chr(181)   ; �
CSU00C4 := chr(196)   ; �
CSU00D6 := chr(214)   ; �
CSU00DC := chr(220)   ; �
CSU00DF := chr(223)   ; �
CSU00E4 := chr(228)   ; �
CSU00F6 := chr(246)   ; �
CSU00FC := chr(252)   ; �
CSU00FF := chr(255)   ; �

CSSSh_L := "LShift"
CSSSh_R := "RShift"
CSSCaps := "CapsLock"
CSS_Del := "Delete"
CSS_Ins := "Insert"
CSS__Up := "Up"
CSSDown := "Down"
CSSRght := "Right"
CSSLeft := "Left"
CSSPgUp := "PgUp"
CSSPgDn := "PgDn"
CSSHome := "Home"
CSS_End := "End"
CSS_F9  := "F9"
CSS_F10 := "F10"
CSS_F11 := "F11"
CSS_F12 := "F12"

CSSN__0 := "Numpad0"
CSSN__1 := "Numpad1"
CSSN__2 := "Numpad2"
CSSN__3 := "Numpad3"

CSSN__4 := "Numpad4"
CSSN__5 := "Numpad5"
CSSN__6 := "Numpad6"

CSSN__7 := "Numpad7"
CSSN__8 := "Numpad8"
CSSN__9 := "Numpad9"

CSSNDiv := "NumpadDiv"
CSSNMul := "NumpadMult"
CSSNSub := "NumpadSub"
CSSNAdd := "NumpadAdd"
CSSNDot := "NumpadDot"
CSSNEnt := "NumpadEnter"

CSSNDel := "NumpadDel"
CSSNIns := "NumpadIns"
CSSN_Up := "NumpadUp"
CSSN_Dn := "NumpadDown"
CSSN_Ri := "NumpadRight"
CSSN_Le := "NumpadLeft"
CSSNPUp := "NumpadPgUp"
CSSNPDn := "NumpadPgDn"
CSSNHom := "NumpadHome"
CSSNEnd := "NumpadEnd"
CSSNClr := "NumpadClear"
