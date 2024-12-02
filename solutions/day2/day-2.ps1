# Part 1

$count = 0 
$problemDampenerCount = 0

Function Get-SafeReports {
    param (
        [int[]]$levels
    )

    $invalid = $false
    $isIncreasing = $true
    $isDecreasing = $true

    for ($i = 0; $i -lt $levels.Count -1; $i++) {
        $diff = $levels[$i + 1] - $levels[$i]

        if (([Math]::Abs($diff) -lt 1) -or ([Math]::Abs($diff) -gt 3)) {
            $invalid = $true
            break
        }

        if ($diff -lt 0){
            $isIncreasing = $false
        } elseif ($diff -gt 0) {
            $isDecreasing = $false
        }
    }

    if (-not ($isIncreasing -or $isDecreasing)) {
        $invalid = $true
    }

    return $invalid
}

Function Run-ProblemDampener {
    param (
        [int[]]$levels
    )

    if (-not (Get-SafeReports -levels $levels)) {
        return $true
    }

    for ($i = 0; $i -lt $levels.Count; $i++) {
        $beforeI = if ($i -gt 0) { $levels[0..($i - 1)] } else { @() }
        $afterI = if ($i -lt $levels.Count - 1) { $levels[($i + 1)..($levels.Count - 1)] } else { @() }

        $testLevels = @($beforeI) + @($afterI)

        if (-not (Get-SafeReports -levels $testLevels)) {
            return $true
        }
    }

    return $false
}

foreach ($line in Get-Content -Path inputs\day2.txt) {
    $splitLine = $line -split " "

    $safe_report = Get-SafeReports -levels $splitLine
    if (-not $safe_report) {
        $count++
    }

    $problemDampener = Run-ProblemDampener -levels $splitLine
    if ($problemDampener) {
        $problemDampenerCount++
    }
}

Write-Output $count
Write-Output $problemDampenerCount

# Part 1: 402
# Part 2: 455