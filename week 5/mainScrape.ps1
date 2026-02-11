. "C:\Users\Carter\SYS320-01\week 5\ScrapeChamplain.ps1"

#daysTranslator(gatherClasses) | 
#    Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | 
#    Where-Object { $_.Instructor -ilike "*Furkan*" }

#daysTranslator(gatherClasses) | Where-Object { ($_."Location" -ilike "FREE 105") -and ($_.days -contains "Wednesday") } |
#            Sort-Object "Time Start" |
#            Select-Object "Time Start", "Time End", "Class Code"


#$ITSInstructors = daysTranslator(gatherClasses) | Where-Object { 
#    ($_."Class Code" -ilike "SYS*") -or
#    ($_."Class Code" -ilike "NET*") -or
#    ($_."Class Code" -ilike "SEC*") -or
#    ($_."Class Code" -ilike "FOR*") -or
#    ($_."Class Code" -ilike "CSI*") -or
#    ($_."Class Code" -ilike "DAT*") 
#    } `
#    | Select-Object "Instructor" -Unique `
#    | Sort-Object Instructor

#$ITSInstructors

$FullTable = daysTranslator(gatherClasses)
$FullTable | Where {$_.Instructor -in $ITSInstructors.Instructor } | Group "Instructor" | Select count, name | Sort-Object Count -Descending