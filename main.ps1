$tesseract = "C:\Program Files\Tesseract-OCR\tesseract.exe"


Write-Host $PSScriptRoot

$input = "\input\test.jpg"
$output = "\output\test"
. $tesseract -l eng $PSScriptRoot$input $PSScriptRoot$output

$text = Get-Content $PSScriptRoot$output".txt"

Write-Host $text