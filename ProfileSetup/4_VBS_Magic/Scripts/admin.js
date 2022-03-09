//---------------------------------------------------------------------------------------
// A script that helps with running programs as administrator from the commandline.
// 
// This is suppose to run through wscript.exe or cscript.exe.
//---------------------------------------------------------------------------------------

var args    = WScript.Arguments;
var shell   = new ActiveXObject('Shell.Application');
var cmd     = 'powershell.exe';
var param   = '';

if (args.Count() > 0) {
    cmd = args(0);

    if (args.Count() > 1) {
        for (var i = 1; i < args.Count(); i++) {
            param += args(i) + ' ';
        }
    }
}

shell.ShellExecute(cmd, param, null, 'runas', 10);

