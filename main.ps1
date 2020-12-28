$tesseract = "C:\Program Files\Tesseract-OCR\tesseract.exe"


Write-Host $PSScriptRoot

$input = "\input\example5.png"
$output = "\output\example5"
. $tesseract -l eng $PSScriptRoot$input $PSScriptRoot$output

$text = Get-Content $PSScriptRoot$output".txt"

Write-Host $text


$test = $text | Select-String "(?:(?:(DOOR|MEDIPACK|BOX|LOCKER|TERMINAL|ZONE|GENERATOR|AMMOPACK))+)[_ ](\d+)" -CaseSensitive

$test = $text | Select-String "([A-Z_]+)[_ ](\d+)" -CaseSensitive
ForEach($x in $test.matches){write-host $x.groups[2]}