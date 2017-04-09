
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#MaxThreads 255
#MaxThreadsBuffer On
#NoEnv
#Persistent
#SingleInstance force
SetBatchLines, -1
Process, Priority, , H
SendMode Input
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
#KeyHistory 0
ListLines Off
SetTitleMatchMode 2
SetTitleMatchMode Fast
SetWinDelay, 0
SetControlDelay, 0
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen
MMdll(ByRef Xpos, ByRef Ypos)
{
    DllCall("mouse_event", uint, 1, int, Xpos, int, Ypos, uint, 0, int, 0)
}


$F10::Reload
$F11::Suspend
$F12::ExitApp


$XButton2::
Xcoord := 959
Ycoord := 539
LookPos := 400
    While(GetKeyState("XButton2", "P"))
    {
        PixelGetColor, FirstMatchColor, LookPos, 539, RGB
        if(LookPos >= Xcoord)
        {
            LookPos := 400
        }
        LookPos++


        Cblue  := (FirstMatchColor & 0xFF)
        Cgreen := ((FirstMatchColor & 0xFF00) >> 8)
        Cred   := ((FirstMatchColor & 0xFF0000) >> 16)
        Pred   := ((100 * Cred) / (Cblue + Cgreen + Cred))
        if(Pred > 50)
        {
            PairMatchPos := 1918 - LookPos
            LookPos := PairMatchPos - 50
            Looklimit := LookPos + 100
            while(LookPos<Looklimit)
            {
                PixelGetColor, PairMatchColor, LookPos, 539, RGB
                LookPos++
                    Cblue_2  := (PairMatchColor & 0xFF)
                    Cgreen_2 := ((PairMatchColor & 0xFF00) >> 8)
                    Cred_2   := ((PairMatchColor & 0xFF0000) >> 16)
                    Pred_2   := ((100 * Cred_2) / (Cblue_2 + Cgreen_2 + Cred_2))
                if(Pred+5>Pred_2)
                {
                    /*
                    Random, Rvar, 50, 100
                    DllCall("mouse_event", uint, 2, int, 0, int, 0, uint, 0, int, 0)
                    Sleep, Rvar
                    Random, Rvar, 50, 100
                    DllCall("mouse_event", uint, 4, int, 0, int, 0, uint, 0, int, 0)
                    Sleep, Rvar
                    */
                    MouseGetPos, x, y
                    ToolTip, "BOOM!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", X, Y
                }
            }
        }
    }
Return
