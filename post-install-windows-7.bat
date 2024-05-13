# Disable Windows Firewall
Set-Service -Name 'MpsSvc' -StartupType Disabled
Stop-Service -Name 'MpsSvc'

# Pauze
Start-Sleep 10

# Disable Windows Update
Set-Service -Name 'wuauserv' -StartupType Disabled
Stop-Service -Name 'wuauserv'

Read-Host -Prompt "Press Enter to exit"