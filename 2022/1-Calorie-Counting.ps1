$Content = Get-Content -Path .\1-Calorie-Counting.txt -Delimiter "`n"

$TotalCalories = 0
$Result = @{}
for ($i = 0; $i -lt $Content.Count; $i++) {
    if ($Content[$i] -as [int]) {
        $TotalCalories = $TotalCalories + $Content[$i]
    } else {
        $Result.Add($i, $TotalCalories)
        $TotalCalories = 0
    }
}


$SortedResults = $Result.Values | Sort-Object -Descending

"Part 1 Solution: {0}" -f $SortedResults | Select-Object -First 1 
"Part 2 Solution: {0}" -f ($SortedResults | Select-Object -First 3 | Measure-Object -Sum | Select-Object -ExpandProperty Sum)
