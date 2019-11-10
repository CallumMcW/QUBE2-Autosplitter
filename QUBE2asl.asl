state("QUBE-Win64-Shipping")
{
    bool loading : "QUBE-Win64-Shipping.exe", 0x274D670;
}

startup {
    vars.ver = "1.0.8.1";
    
    // Log Output switch for DebugView (enables/disables debug messages)
    var DebugEnabled = true;
    Action<string> DebugOutput = (text) => {
        if (DebugEnabled)
        {
            print(" «[QUBE2ASL - v" + vars.ver + "]» " + text);
        }
    };
    vars.DebugOutput = DebugOutput;
}

init {
    vars.DebugOutput("initialized script");
    timer.IsGameTimePaused = true;
}

update {
    if(current.loading != old.loading) {
        // the value changed, write it to our debug output
        vars.DebugOutput("loading state changed from " + old.loading + " to " + current.loading);
    }
}

isLoading
{
    return current.loading;
}

exit
{
    timer.IsGameTimePaused = true;
}