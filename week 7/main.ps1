. "C:\Users\Carter\SYS320-01\week 6\Event-Logs.ps1"
. "C:\Users\Carter\SYS320-01\week 7\Configuration.ps1"
. "C:\Users\Carter\SYS320-01\week 7\Email.ps1"
. "C:\Users\Carter\SYS320-01\week 7\Scheduler.ps1"

$Configuration = readConfiguration

$failed = getFailedLogins $configuration.Days | Group-Object -Property User | Where-Object {$_.Count -gt 10} | Select-Object Name, Count

SendAlertEmail ($failed | Format-Table | Out-String)

ChooseTimeToRun ($configuration.ExecutionTime)