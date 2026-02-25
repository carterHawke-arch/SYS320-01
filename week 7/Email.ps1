function SendAlertEmail($Body){

    $From = "carter.hawke@mymail.champlain.edu"
    $To = "carter.hawke@mymail.champlain.edu"
    $Subject = "Suspicious Activity"

    $Password = Get-Content "C:\Users\Carter\SYS320-01\week 7\file.txt" | ConvertTo-SecureString
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
    -port 587 -UseSsl -Credential $Credential

    }

SendAlertEmail "Body of email"