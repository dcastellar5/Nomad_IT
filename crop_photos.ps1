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

$p3 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_pdf_page_3.png"
$p4 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_pdf_page_4.png"

$img3 = [System.Drawing.Bitmap]::FromFile($p3)
$W = $img3.Width
$H = $img3.Height
$img3.Dispose()

Write-Host "Rendering dimensions: $W x $H"

# Page 3 Photos:
# Top left: iPORT / power connection
# Top right: iPORT and Ethernet cabling
# Middle left: Powered Eaton surge protector
# Middle right: iPORT cabling after inspection
# Bottom: CFD charging verification - 10:05

# Page 3 crops:
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_1.jpg" ([int]($W*0.10)) ([int]($H*0.11)) ([int]($W*0.38)) ([int]($H*0.23))
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_2.jpg" ([int]($W*0.51)) ([int]($H*0.11)) ([int]($W*0.38)) ([int]($H*0.23))
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_3.jpg" ([int]($W*0.10)) ([int]($H*0.38)) ([int]($W*0.38)) ([int]($H*0.21))
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_4.jpg" ([int]($W*0.51)) ([int]($H*0.38)) ([int]($W*0.38)) ([int]($H*0.23))
CropImage $p3 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_5.jpg" ([int]($W*0.10)) ([int]($H*0.64)) ([int]($W*0.48)) ([int]($H*0.22))

# Page 4 crops:
# Top left: NPOS station / iPORT hardware
# Top right: CFD charging verification - 9:56
# Bottom left: Ethernet DHCP verification .87
# Bottom right: Ethernet DHCP verification .95
CropImage $p4 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_6.jpg" ([int]($W*0.10)) ([int]($H*0.11)) ([int]($W*0.38)) ([int]($H*0.21))
CropImage $p4 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_7.jpg" ([int]($W*0.51)) ([int]($H*0.11)) ([int]($W*0.38)) ([int]($H*0.21))
CropImage $p4 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_8.jpg" ([int]($W*0.10)) ([int]($H*0.36)) ([int]($W*0.38)) ([int]($H*0.21))
CropImage $p4 "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_actual_9.jpg" ([int]($W*0.51)) ([int]($H*0.36)) ([int]($W*0.38)) ([int]($H*0.21))
