Add-Type -AssemblyName System.Drawing
$p7 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_7.png"
$src = [System.Drawing.Bitmap]::FromFile($p7)
$W = $src.Width
$H = $src.Height

# Crop the full Appendix A diagram and table with high clarity
$rect = New-Object System.Drawing.Rectangle(([int]($W*0.05)), ([int]($H*0.05)), ([int]($W*0.90)), ([int]($H*0.88)))
$crop = $src.Clone($rect, $src.PixelFormat)
$crop.Save("C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_diagram_full.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$crop.Dispose()

# Also crop just the upper visual switch diagram with clean margins
$rectTop = New-Object System.Drawing.Rectangle(([int]($W*0.05)), ([int]($H*0.05)), ([int]($W*0.90)), ([int]($H*0.48)))
$cropTop = $src.Clone($rectTop, $src.PixelFormat)
$cropTop.Save("C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_diagram_top.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$cropTop.Dispose()

$src.Dispose()
Write-Host "Diagrams cropped successfully!"
