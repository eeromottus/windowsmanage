Check the scheduled task:
Get-ScheduledTask -TaskName "Ansible Maintenance Wake" |
    Select-Object TaskName, State,
        @{Name="WakeToRun"; Expression={$_.Settings.WakeToRun}}
Check active wake timers:
powercfg /waketimers
Start the task manually for testing:
Start-ScheduledTask -TaskName "Ansible Maintenance Wake"
The log will be written to:
C:\ProgramData\AnsibleMaintenance\maintenance.log
