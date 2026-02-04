$ips = Select-String -Path C:\xampp\apache\logs\access.log -Pattern " 404 " |
    ForEach-Object { $_.Line.Split(' ')[0] } 

$ipCount = @{}

ForEach ($ip in $ips) {
    if ($ipCount.ContainsKey($ip)) {
        $ipCount[$ip]++
        } else {
        $ipCount[$ip] = 1
        }
}

$ipCount