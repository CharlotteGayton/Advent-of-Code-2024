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
    $guardDirection = $direction[$guardFacing] 
    $i = $currentPosition[0]
    $j = $currentPosition[1]

    if ($guardDirection -eq "up") {
        $i -= 1
    }
    if ($guardDirection -eq "left") {
        $j -= 1
    }
    if ($guardDirection -eq "right") {
        $j += 1
    }
    if ($guardDirection -eq "down") {
        $i += 1
    }
    if (Check-ForObstacle -content $content -i $i -j $j) {
        $guardFacing = Turn-Guard -direction $direction -guardFacing $guardFacing
    } else {
        return @($i, $j), $timesMoved++, $guardFacing
    }
}

function Check-ForObstacle {
    param (
        $content,
        $i,
        $j
    )
    # if ($i -gt $content.Length -or $j -gt $content.Length) {
    #     return $false
    # }
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



$loop = $true
while ($loop) {
    $oldPosition = $currentPosition
    $currentPosition, $timesMoved, $guardFacing = Move-Guard -guardFacing $guardFacing -currentPosition $currentPosition -content $content -direction $direction
    if ($null -ne $currentPosition) {
        if (Check-OffMap -content $content -currentPosition $currentPosition) {
            $loop = $false
        }
    }
    else {
        $currentPosition = $oldPosition
    }
}

Write-Output $timesMoved
