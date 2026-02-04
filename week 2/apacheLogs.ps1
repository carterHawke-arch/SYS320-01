Select-String -Path C:\xampp\apache\logs\access.log -Pattern " 404 " |
    ForEach-Object { $_.Line.Split(' ')[0] } | Group-Object | Sort-Object Count |
    Select-Object Count, Name