<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword($password) {

    $plain = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

    # Check length
    if ($plain.Length -lt 6) {
        return $false
    }

    # Check for at least 1 special
    if ($plain -notmatch '[^a-zA-Z0-9]') {
        return $false
    }

    # Check for at least 1 number
    if ($plain -notmatch '[0-9]') {
        return $false
    }

    # Check for at least 1 letter
    if ($plain -notmatch '[a-zA-Z]') {
        return $false
    }

    return $true
}