/* 
   ------------------------------------------------------
   All.ahk:
   Diese Datei ist f�r Entwickler zum schnellen Testen von �nderungen vorgesehen. Bei Syntaxfehlern bietet sie zudem den Vorteil, dass die Zeilennummern relativ zu den einzelnen Modulen angezeigt werden.

   Die Reihenfolge der Includes *ist* relevant!
   Denn: Vor dem Men� in der Global-Part.ahk d�rfen keine Tastenkombinationen definiert werden. Ansonsten k�nnen Sie die Dateien hier beliebig anordnen. :-)

   Siehe auch:
   http://www.autohotkey.com/docs/commands/_Include.htm

   ------------------------------------------------------
*/


#Include %a_scriptdir%\Warning.ahk
#Include %a_scriptdir%\Global-Part.ahk
#Include %a_scriptdir%\Methods-Layers.ahk
#Include %a_scriptdir%\Keys-Qwert-to-Neo.ahk
#Include %a_scriptdir%\Keys-Neo.ahk
#Include %a_scriptdir%\Methods-Lights.ahk
#Include %a_scriptdir%\Methods-Other.ahk
#Include %a_scriptdir%\Methods-Unicode.ahk
#Include %a_scriptdir%\Methods-ScreenKeyboard.ahk

; Eines sch�nen Tages sollten auch die Compose-Kombinationen automatisch aus der Referenz erzeugt werden. Derzeitig gibt es nur den (h�chst instabilen und experimentellen!) Compose-Playground:
;#Include *i %a_scriptdir%\..\Compose\Compose-all-in-one.ahk

