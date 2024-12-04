$fileContent = Get-Content -Path inputs\day4test.txt

$hashtable = [ordered]@{}
$index = 0 
foreach ($line in Get-Content -Path inputs\day4test.txt) {
    $hashtable.Add($index, $line)
    $index++
}
$test = @()
foreach ($line in Get-Content -Path inputs\day4test.txt) {
    $test += $line
}

Write-Output $test

for ($i = 0; $i -lt $test.Count; $i++) {
    $line = $test[$i]
    for ($j = 0; $j -lt $test.Count; $j++) {
        $char = $line[$j]
        if ($char -eq "X") {
            $horizontal = ($i + 1, $j)
            $vertical = ($i, $j + 1)
            $diagonal = ($i + 1, $j + 1)
            $diagonal2 = ($i - 1, $j + 1)
            $diagonal3 = ($i + 1, $j - 1)
            $diagonal4 = ($i - 1, $j - 1)
        }
    }
}

# $pattern = "XMAS|SAMX"

# $horizontalMatches = [regex]::Matches($fileContent, $pattern)
# Write-Output $horizontalMatches.Count


function checkHorizontal {
    param (
        $fileContent
    )

    $pattern = "XMAS|SAMX"

    $horizontalMatches = [regex]::Matches($fileContent, $pattern)
    return $horizontalMatches.Count
}



# function checkVertical {
#     param (
#         $fileContent
#     )

#     for ($i = 0; $i -lt $fileContent.Count; $i++) {
#         $line = $fileContent[$i]
#         for ($j = 0; $j -lt $line.Count; $j++) {
#             $char = $line[$j]
#             $checking = $true
#             $index = 0 
#             while $checking {
#                 if ($char -eq "X") {
#                     $index++
#                     $pattern = "XMAS"
#                     $result = Check-NextLine -fileContent $fileContent -i $i -j $j -nextLetter $pattern[$index]
#                     if $result = ""
#                 }

#             }
#             if ($char -eq "X") {
#                 Check-NextLine
#             }
#         }
#     }
#     foreach ($line in $fileContent) {
#         foreach ($char in $line) {

#             while $checking {
#                 if ($char -eq "X") {
#                     Check-NextLine
#                 }
#             }
#             if ($char -eq "X") {
                
#             }
#         }
#     }
# }

function Flip-Array {
    param (
        $fileContent
    )

    $transposed = @()

    Write-Output $fileContent.Length



    for ($i = 0; $i -lt $array.Count; $i++) {
        
    }

    for ($i = 0; $i -lt $fileContent.Length; $i++) {
        $row = ($fileContent | ForEach-Object {
            if ($i -lt $_.Length) { $_[$i] } else { "" }
        }) -join ""
        $transposed += $row
    }
    
}

$flippedArray = Flip-Array -fileContent $fileContent
Write-Output $flippedArray

function Check-NextLine {
    param (
        $fileContent,
        $i,
        $j,
        $nextLetter
    )

    $nextLine = $fileContent[$i + 1]
    $nextChar = $nextLine[$j]
    if ($nextChar -eq "X") {
        $count++
    }

}


$count = checkHorizontal -fileContent $fileContent
Write-Output $count