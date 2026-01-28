cd $PSScriptRoot

function GetLoginouts {
    param (
        [string]$days
        )
    # Get login and logoff records from Windows Events and save to a variable
    $loginouts = Get-EventLog -LogName System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days) 
    $loginoutsTable = @() # Empty array to fill customly
    for($i=0; $i -lt $loginouts.Count; $i++){
            # Creating event property value
            $event = ""
            if($loginouts[$i].InstanceID -eq 7001) {$event="Logon"}
            if($loginouts[$i].InstanceID -eq 7002) {$event="Logoff"}
            # Creating user property value
            $sid = New-Object -TypeName System.Security.Principal.SecurityIdentifier -ArgumentList $loginouts[$i].ReplacementStrings[1]
            $user = $sid.Translate([System.Security.Principal.NTAccount]).Value
            # Adding each new line (in form of a custom object) to our empty array
            $loginoutsTable += [PSCustomObject]@{
                "Time" = $loginouts[$i].TimeGenerated;
                "Id" = $loginouts[$i].InstanceID;
                "Event" = $event;
                "User" = $user;
            }
        } # End of for   
        $loginoutsTable
}

function GetStartup {
    param (
        [string]$days
        )
        $startup = Get-EventLog System -After (Get-Date).AddDays(-$days) | Where-Object {$_.EventID -eq 6005}
        $uptable = @()
        for($i=0; $i -lt $startup.Count; $i++){
            $event = ""
            if($startup[$i].EventID -eq 6005) {$event="Startup"}
            $user = "System"
            $uptable += [PSCustomObject]@{
                "Time" = $startup[$i].TimeGenerated;
                "Id" = $startup[$i].InstanceID;
                "Event" = $event;
                "User" = $user;
            }
        }
        $uptable
}

function GetShutdown {
    param (
        [string]$days
        )
        $shutdown = Get-EventLog System -After (Get-Date).AddDays(-$days) | Where-Object {$_.EventID -eq 6006}
        $downtable = @()
        for($i=0; $i -lt $shutdown.Count; $i++){
            $event = ""
            if($shutdown[$i].EventID -eq 6006) {$event="Shutdown"}
            $user = "System"
            $downtable += [PSCustomObject]@{
                "Time" = $shutdown[$i].TimeGenerated;
                "Id" = $shutdown[$i].InstanceID;
                "Event" = $event;
                "User" = $user;
            }
        }
        $downtable
}
#GetLoginouts(6);
GetStartup(900);
GetShutdown(900);