# Part 1: 175615763

$total = 0
$pattern = "(mul\([0-9]{1,3},[0-9]{1,3}\))"
$numbers = "[0-9]{1,3},[0-9]{1,3}"

foreach ($line in Get-Content -Path inputs\day3.txt) {
    $matches = [regex]::Matches($line, $pattern)
    foreach ($match in $matches) {
        $numberMatches = [regex]::Matches($match, $numbers)
        $numbersSplit = $numberMatches[0] -split ','
        $multiply = [int]$numbersSplit[0] * [int]$numbersSplit[1]
        $total += $multiply
        }
    }
    

Write-Output $total

# Part 2: 74361272

$total = 0 
$pattern = "(mul\([0-9]{1,3},[0-9]{1,3}\))|do\(\)|don\'t\(\)"
$numbers = "[0-9]{1,3},[0-9]{1,3}"
$instruction = $true

foreach ($line in Get-Content -Path inputs\day3.txt) {
    $matches = [regex]::Matches($line, $pattern)
    foreach ($match in $matches) {
        if ($match -match "do\(\)"){
            $instruction = $true
        } elseif ($match -match "don't\(\)") {
            $instruction = $false
        } else {
            if ($instruction) {
                $numberMatches = [regex]::Matches($match, $numbers)
                $numbersSplit = $numberMatches[0] -split ','
                $multiply = [int]$numbersSplit[0] * [int]$numbersSplit[1]
                $total += $multiply
            }
        }
    }
}
Write-Output $total