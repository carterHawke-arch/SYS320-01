$chrome = Get-Process -Name "chrome" -ErrorAction SilentlyContinue
if ($chrome) {
    Stop-Process -Name "chrome" -Force
    Write-Host "Stopped"
} 
else {
    Start-Process "chrome.exe" "https://www.champlain.edu"
    Write-Host "Started"
}
