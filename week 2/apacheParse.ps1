function ApacheLogs1()
{
    $lines = Get-Content -Path C:\xampp\apache\logs\access.log
    $Array = @()

    ForEach ($line in $lines) {
        $words = $line.Split(' ')
    
        if ($words.Count -ge 1) {
            $Array += [PSCustomobject]@{
                ip = $words[0]
                time = $words[3] -replace '"', ''
                method = $words[5] -replace '"', ''
                page = $words[6]
                protocol = $words[7] -replace '"', ''
                response = $words[8]
                referrer = $words[10] -replace '"', ''
            }
        }
    }

    $Array
}

