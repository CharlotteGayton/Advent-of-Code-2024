# Part 1

$count = 0 

foreach ($line in Get-Content -Path inputs\day2.txt) {
    $splitLine = $line -split " "
    $invalid = $false

    $isIncreasing = $true
    $isDecreasing = $true

    for ($i = 0; $i -lt $splitLine.Count; $i++) {
        $diff = [int]$splitLine[$i + 1] - [int]$splitLine[$i]

        if ([Math]::Abs($diff) -lt 1 -or [Math]::Abs($diff) -gt 3) {
            $invalid = $true
            break
        }

        if ($diff -lt 0){
            $isIncreasing = $false
        } elseif ($diff -gt 0) {
            $isDecreasing = $false
        }
    }

    if ($invalid -or (-not ($isIncreasing -or $isDecreasing))) {
        Write-Output "Invalid: $line"
    }
    else {
        $count++
    }
}

Write-Output $count

# Part 1: 402