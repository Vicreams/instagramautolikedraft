F1::domino66Click()
count := 0
domino66Click(Interval=1){

   local vTIMES
   local vSPEED
   local vLIEN
   local vLOGIN
   Gui, Font, s8, Verdana
   Gui, Add, Text, x10 y6 w80 Center, Combien de fois?
   Gui, Add, Edit, x+5 w70 vTIMES, Ecrire ici...
   Gui, Add, Button, x+10, Valider
   Gui, Add, Text, x10 y36 w80 Center, Quelle vitesse?
   Gui, Add, Edit, x+5 w70 vSPEED, Ecrire ici...
   Gui, Add, Button, x+10, Valider
   Gui, Add, Button, x10 y66 w80 Center gLaunch, Commencer
   Gui, Add, CheckBox, checked x230 y10 vLIEN gChecked, Déjà prêt (instructions)
   Gui, Add, CheckBox, checked x230 y30 vLOGIN gCheckLogin, Déjà login
   Gui, Add, Edit, x230 y50 w120 vUSERNAME, nom d'utilisateur
   Gui, Add, Edit, x230 y73 w120 vPASSWORD, mot de passe
   GuiControl, Hide, LOGIN
   GuiControl, Hide, USERNAME
   GuiControl, Hide, PASSWORD
   Gui, Add, CheckBox, checked x10 y90 vNumEqualToOne gCheckTarget, Seulement une personne
   Gui, Add, Edit, x15 y110 w90 vTargetUsername, example
   Gui, Add, Edit, x15 y110 w150 vTargetUsernamePLURAL, example1,example2,e3
   GuiControl, Hide, TargetUsernamePLURAL
   Gui, Show, w400 h150, Instagram-autolike
   Gui, Submit, NoHide
   return
   GuiEscape:
   GuiClose:
   ExitApp
   return
   Checked:
   Gui, Submit, NoHide
   if (LIEN = 1) {
   GuiControl, Hide, LOGIN
   } else {
   GuiControl, Show, LOGIN
   }
   Return
   CheckLogin:
   Gui, Submit, NoHide
   if (LOGIN = 1) {
   GuiControl, Hide, USERNAME
   GuiControl, Hide, PASSWORD
   } else {
   GuiControl, Show, USERNAME
#SingleInstance
   GuiControl, Show, PASSWORD
   }
   Return
   CheckTarget:
   Gui, Submit, NoHide
   if (NumEqualToOne = 1) {
   GuiControl, Hide, TargetUsernamePLURAL
   GuiControl, Show, TargetUsername
   } else {
   GuiControl, Show, TargetUsernamePLURAL
   GuiControl, Hide, TargetUsername
   }
   Return
   Launch:
   Gui, Submit, NoHide
   if TIMES is digit
   {
       if SPEED is digit
       {
          if (SPEED > 500) {
            MsgBox Tout les critères sont bons, c'est partii!
            if (LIEN = 0) {
            if (LOGIN = 0) {
               Run, chrome.exe "https://www.instagram.com/accounts/login/?source=auth_switcher"
	       WinMaximize, ahk_class Chrome_WidgetWin_1
	       Sleep 4*SPEED
	       Click 815, 386
               Send, %USERNAME%
	       Click 815, 443
               Send, %PASSWORD%
	       Click 815, 518
            } else {
               Run, chrome.exe "instagram.com"
	       Sleep 4*SPEED
               }
            }
            if (NumEqualToOne = 1) {
               Run, chrome.exe instagram.com/"%TargetUsername%"
            } else {
               StringSplit, TargetSeparated, TargetUsernamePLURAL, `,
	       Loop, %TargetSeparated0% {
                  processedtarget := TargetSeparated%A_Index%
                  Run chrome.exe instagram.com/"%processedtarget%"
               }
            }
            loop % times {
	       Click 668,569
	       Click 668,569
               count += 1
	       Click 1680,610
               Tooltip %count%, %count%
	       Sleep % speed
               Tooltip %count%, %count%
	       if GetKeyState("Shift", "P") ; Looks to see if Shift is pressed
               break  ; exits Loop
             }
          }
       } else {
          MsgBox Tu as oublié d'indiquer la vitesse du programme!
       }
   } else {
      MsgBox Tu as oublié d'indiquer le nombre de photos!
   }
Return
}
