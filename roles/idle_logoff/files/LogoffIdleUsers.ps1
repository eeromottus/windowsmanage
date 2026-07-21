param(
    [int]$IdleHours = 24
)

$IdleLimitSeconds = $IdleHours * 3600

quser | Select-Object -Skip 1 | ForEach-Object {

    $line = ($_ -replace '^\s+','') -replace '\s{2,}',','
    $parts = $line.Split(',')

    if ($parts.Count -lt 5) {
        return
    }

    $SessionId = $parts[2]
    $Idle = $parts[4]

    $Seconds = 0

    if ($Idle -match '^(\d+)\+(\d+):(\d+)$') {
        $Seconds = ($matches[1] * 86400) +
                   ($matches[2] * 3600) +
                   ($matches[3] * 60)
    }
    elseif ($Idle -match '^(\d+):(\d+)$') {
        $Seconds = ($matches[1] * 3600) +
                   ($matches[2] * 60)
    }
    elseif ($Idle -match '^(\d+)$') {
        $Seconds = $matches[1] * 60
    }

    if ($Seconds -ge $IdleLimitSeconds) {
        Write-Host "Logging off session $SessionId"
        logoff $SessionId
    }
}
