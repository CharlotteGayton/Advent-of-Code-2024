$leftColumn = @()
$rightColumn = @()

foreach ($line in Get-Content -Path inputs\day1.txt) {
    if ($line -match "([0-9]*)   ([0-9]*)") {
        $leftColumn += [int]$Matches[1]
        $rightColumn += [int]$Matches[2]
    }
}

$leftSorted = $leftColumn | Sort-Object
$rightSorted = $rightColumn | Sort-Object

$finalResult = 0 
$similarityScore = 0 

$grouped = $rightSorted | Group-Object

for ($i = 0; $i -lt $leftSorted.Count; $i++) {
    $difference = $leftSorted[$i] - $rightSorted[$i]
    $count = ($grouped | Where-Object { $_.Name -eq $leftSorted[$i] }).Count
    if ($difference -lt 0) {
        $difference = $difference * -1
    }
    $similarityScore += $leftSorted[$i] * $count
    $finalResult += $difference
}

Write-Output $finalResult
Write-Output $similarityScore

# Part 1: 2196996
# Part 2: 23655822