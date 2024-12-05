
$content = Get-Content -Path inputs/day5test.txt

$rules = @()
$updates = @()

$part1 = $true
foreach ($line in $content) {
    if ($line -eq "") {
        $part1 = $false
        continue
    }
    if ($part1) {
        $matches = [regex]::Matches($line, '([0-9]*)\|([0-9]*)')
    
        $rules += [PSCustomObject]@{firstValue = $matches.groups[1]
                                    secondValue = $matches.groups[2]}
    } else {
        $updates += $line
    }
}

function Get-MatchedRule {
    param (
        $x,
        $y
    )

    $result = $rules | Where-Object { $_.firstValue -eq $x -and $_.secondValue -eq $y }
    return $result
}

foreach ($update in $updates) {
    $splitUpdate = $update -split ","
    for ($i = 0; $i -lt $splitUpdate.count; $i++) {
        for ($j = $i + 1; $j -lt $splitUpdate.Count; $j++) {
            $x = $splitUpdate[$i]
            $y = $splitUpdate[$j]
            $rule = Get-MatchedRule -x $x -y $y
            if ($rule) {
                Write-Output "Rule accepted"
            }
        }
        $currentCharacter = $update[$i]

    }

}

Write-Output $rules
Write-Output $updates