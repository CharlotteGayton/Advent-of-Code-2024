$fileContent = Get-Content -Path inputs\day4.txt

# Part 1: 2458

# Find all X coordinates
$xcoordinates = @()
for ($i = 0; $i -lt $fileContent.Count; $i++) {
    $line = $fileContent[$i]
    for ($j = 0; $j -lt $line.Length; $j++) {
        $char = $line[$j]
        if ($char -eq "X") {
            $xcoordinates += [PSCustomObject]@{icoor = $i
                                                jcoor = $j}
        }
    }
}

Write-Output $xcoordinates.Count

$xmCoordinates = @()
foreach ($x in $xcoordinates) {
    for ($i = -1; $i -lt 2; $i++){
        for ($j = -1; $j -lt 2; $j++){
            $newCoordinatei = $x.icoor + $i
            $newCoordinatej = $x.jcoor + $j
            if ($newCoordinatei -ge 0 -and $newCoordinatej -ge 0 -and $newCoordinatei -lt $fileContent.Count -and $newCoordinatej -lt $fileContent[$newCoordinatei].Length) {
                if ($fileContent[$newCoordinatei][$newCoordinatej] -eq "M") {
                    $xmCoordinates += [PSCustomObject]@{xcoori = $x.icoor
                                                        xcoorj = $x.jcoor
                                                        mcoori = $newCoordinatei
                                                        mcoorj = $newCoordinatej}
                }
            }
        }
    }
}

Write-Output $xmCoordinates

$count = 0 
# Find rest of word
foreach ($xm in $xmCoordinates) {
    $directioni = $xm.mcoori - $xm.xcoori
    $directionj = $xm.mcoorj - $xm.xcoorj 
    $Atargeti = $xm.mcoori + $directioni
    $Atargetj = $xm.mcoorj + $directionj
    if ($Atargeti -ge 0 -and $Atargetj -ge 0 -and $Atargeti -lt $fileContent.Count -and $Atargetj -lt $fileContent[$Atargeti].Length) {
        if ($fileContent[$Atargeti][$Atargetj] -eq "A") {
            $Stargeti = $Atargeti + $directioni
            $Stargetj = $Atargetj + $directionj
            if ($Stargeti -ge 0 -and $Stargetj -ge 0 -and $Stargeti -lt $fileContent.Count -and $Stargetj -lt $fileContent[$Stargeti].Length) {
                if ($fileContent[$Stargeti][$Stargetj] -eq "S") {
                    $count++
                }
        }
    }
}
}

Write-Output $count
