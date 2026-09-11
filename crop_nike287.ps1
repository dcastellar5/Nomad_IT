Add-Type -AssemblyName System.Drawing

function CropImage($srcPath, $outPath, $x, $y, $w, $h) {
    $src = [System.Drawing.Bitmap]::FromFile($srcPath)
    $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
    $crop = $src.Clone($rect, $src.PixelFormat)
    $crop.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $crop.Dispose()
    $src.Dispose()
    Write-Host "Cropped $outPath ($w x $h)"
}

$p3 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_3.png"
$p4 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_4.png"
$p5 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_5.png"
$p6 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_6.png"
$p7 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_7.png"

$img4 = [System.Drawing.Bitmap]::FromFile($p4)
$W = $img4.Width
$H = $img4.Height
$img4.Dispose()

Write-Host "Rendering dimensions: $W x $H"

# Page 4: Figure 1 - Full server rack overview
CropImage $p4 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_actual_1.jpg" ([int]($W*0.28)) ([int]($H*0.33)) ([int]($W*0.44)) ([int]($H*0.48))

# Page 5: Figure 2 - Detailed switching area
CropImage $p5 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_actual_2.jpg" ([int]($W*0.08)) ([int]($H*0.05)) ([int]($W*0.84)) ([int]($H*0.48))

# Page 6: Figure 3 - Close-up of Switch 2 cabling & labels
CropImage $p6 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_actual_3.jpg" ([int]($W*0.08)) ([int]($H*0.05)) ([int]($W*0.84)) ([int]($H*0.48))

# Page 3: Switch 2 Port Migration Diagram
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_actual_4.jpg" ([int]($W*0.08)) ([int]($H*0.06)) ([int]($W*0.84)) ([int]($H*0.33))

# Page 7: Switch 2 Port Migration Diagram & Table
CropImage $p7 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_actual_5.jpg" ([int]($W*0.06)) ([int]($H*0.06)) ([int]($W*0.88)) ([int]($H*0.78))
