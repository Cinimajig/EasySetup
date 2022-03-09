'----------------------------------------------------------------------------------------
' Script for helping with debugging vb-scripts wihtout a fancy IDE.
' It can only run through cscript.exe.
'----------------------------------------------------------------------------------------
Dim PROC__

PROC__ = (InStrRev(UCase(WScript.FullName), "CSCRIPT") <> 0)

If PROC__ <> -1 Then
	WScript.Quit
End if

WScript.Echo "Cltr+Z to run it." & vbCrLf

On Error Resume Next

Do While True
    Call ExecuteGlobal(WScript.StdIn.ReadAll)

    If (Err.Number > 0) And (PROC__ = -1) Then
        WScript.Echo("Error = " & Err.Number & ", Description = " & Err.Description)
        Err.Clear
    End If
Loop