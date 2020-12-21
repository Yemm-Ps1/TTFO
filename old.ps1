
Add-Type -AssemblyName "System.Drawing"
Add-Type -Path ".\Lib\Tesseract.dll"

$tesseract = New-Object Tesseract.TesseractEngine((Get-Item ".\Lib\tessdata").FullName, "eng", [Tesseract.EngineMode]::Default, $null)
#$image = New-Object System.Drawing.Bitmap("test.jpg")

$image = [System.Drawing.Bitmap]::FromFile("C:\Users\alex.yemm\Documents\Tesseract\test.jpg")
$pix = [Tesseract.PixConverter]::ToPix($image)
$page = $tesseract.Process($pix)


$text = $page.GetText()
$confidence = $page.GetMeanConfidence()

$text
$confidence

$image.Dispose()
$page.Dispose()