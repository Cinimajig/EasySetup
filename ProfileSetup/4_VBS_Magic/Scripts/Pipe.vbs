'----------------------------------------------------------------------------------------
' Script for Piping VB-Script code from other sources. The code comes from StdIn and is 
' most useful from batch-files (might want to use "chcp 1252" beforehand).
'----------------------------------------------------------------------------------------

Call ExecuteGlobal(WScript.StdIn.ReadAll)

