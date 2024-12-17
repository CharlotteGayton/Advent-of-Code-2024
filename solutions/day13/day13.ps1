$string = Get-Content "./inputs/day13test.txt" | Out-String

$nl = [System.Environment]::NewLine
$split_content = ($string -split "$nl$nl")

$operations = @() 
foreach ($content in $split_content){
    $new_lines = $content -split "\n"
    $a = [regex]::Matches($new_lines[0], "Button A: X\+([0-9]*), Y\+([0-9]*)")
    $b = [regex]::Matches($new_lines[1], "Button B: X\+([0-9]*), Y\+([0-9]*)")
    $prize = [regex]::Matches($new_lines[2], "Prize\: X\=([0-9]*), Y\=([0-9]*)")
    $numbers = [PSCustomObject]@{
        aa = [int]$a.groups[1].Value
        ab = [int]$a.groups[2].Value
        ba = [int]$b.groups[1].Value
        bb = [int]$b.groups[2].Value
        u = [int]$prize.groups[1].Value
        v = [int]$prize.groups[2].Value
    }
    # $matches = [regex]::Matches$content, 'Button A: X\+([0-9]*), Y\+([0-9]*)\nButton B: X\+([0-9]*), Y\+([0-9]*)\nPrize\: X\=([0-9]*), Y\=([0-9]*)')
    # $numbers = [PSCustomObject]@{
    #     aa = [int]($matches.groups[0])
    #     ab = [int]($matches.groups[1])
    #     ba = [int]($matches.groups[2])
    #     bb = [int]($matches.groups[3])
    #     u = [int]($matches.groups[4])
    #     v = [int]($matches.groups[5])
    # }
    if ($numbers.aa -gt $numbers.ba) {
        $f = $numbers.u * $numbers.ba / $numbers.aa
        $g = $numbers.ab * $numbers.ba / $numbers.aa
        $y = ($numbers.v - $f) / ($numbers.bb - $g)
        $answer = @((($f - $g * $y) / $numbers.ba), $y)
    } 
    else {
        $f = $numbers.v * $numbers.aa / $numbers.ba
        $g = $numbers.bb * $numbers.aa / $numbers.ba
        $x = ($numbers.u - $f) / ($numbers.ab - $g)
        $answer = @($x, (($f - $g * $x) / $numbers.aa)) 
    }

    Write-Output $answer



    # aa * x + ab * y = u
    # ba * x + bb * y = v
    

    
}