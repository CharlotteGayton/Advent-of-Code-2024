$content = Get-Content -Path inputs/day6test.txt

# Initial position of guard
for ($i = 0; $i -lt $content.Count; $i++) {
    $line = $content[$i]
    if ($line.Contains("^")) {
        $currentPosition = @( $i, $line.indexOf("^") )
        break
    }
}

Write-Output $currentPosition

$direction = @("up", "right", "down", "left")
$guardFacing = 0
$timesMoved = 0 

function Move-Guard {
    param (
        $guardFacing,
        $currentPosition,
        $content,
        $direction
    )
    $guardDirection = $direction[0] 
    $i = $currentPosition[0]
    $j = $currentPosition[1]

    if ($guardFacing -eq "up") {
        $j -= 1
    }
    if ($guardFacing -eq "left") {
        $i -= 1
    }
    if ($guardFacing -eq "right") {
        $i += 1
    }
    if ($guardFacing -eq "down") {
        $j += 1
    }
    if (Check-ForObstacle -content $content -newPosition $newPosition) {
        $guardFacing = Turn-Guard -direction $direction -guardFacing $guardFacing
    } else {
        $newPosition = ($i, $j)
        $timesMoved++
    }
}

function Check-ForObstacle {
    param (
        $content,
        $newPosition
    )
    $i = $newPosition[0]
    $j = $newPosition[1]
    $tile = $content[$i][$j]
    if ($tile -eq "#") {
        return $true
    }
    return $false
}

function Check-OffMap {
    param (
        $content,
        $currentPosition
    )

    if (($currentPosition[0] -ge $content.Length) -or ($currentPosition[1] -ge $content.Length)){
        return $true
    }
    return $false
    
}

function Turn-Guard {
    param (
        $direction,
        $guardFacing
    )

    if ($guardFacing -eq 4) {
        $guardFacing = 0 
    } else {
        $guardFacing += 1
    }
    return $guardFacing
}

Write-Output $timesMoved