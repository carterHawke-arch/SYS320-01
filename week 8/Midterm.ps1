# Challenge 1

function getIOC(){
    
    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.6/IOC.html
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")
    $fulltable = @()

    for($i=1; $i -lt $trs.length; $i++){
        $tds = $trs[$i].getElementsByTagName("td")

        $fulltable += [PSCustomObject]@{
            "Pattern" = $tds[0].innerText;
            "Explanation" = $tds[1].innerText
        }
    }
    return $fulltable
}

# getIOC | Format-Table -AutoSize


# Challenge 2

function getAccessLog(){
    $lines = Get-Content "$PSScriptRoot\access.log"
    $fulltable = @()

    foreach($line in $lines){
        $parts = $line -split ' '
        $fulltable += [PSCustomObject]@{
            "IP" = $parts[0]
            "Time" = $parts[3].TrimStart('[')
            "Method" = $parts[5] -replace '"', ''
            "Page" = $parts[6]
            "Protocol" = $parts[7]
            "Response" = $parts[8]
            "Referrer" = $parts[10]
        }
    }
    return $fulltable
}

# getAccessLog | Format-Table -AutoSize

function getProperty($logs, $IOCs){
    
    $properties = @()

    foreach($log in $logs){
        foreach($IOC in $IOCs){
            if($log.Page -like "*$($IOC.Pattern)*"){
                $properties += $log
                break
            }
        }
    }
    return $properties
}

getProperty (getAccessLog) (getIOC) | Format-Table -AutoSize