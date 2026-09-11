Add-Type -AssemblyName System.Drawing
$p3 = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_pdf_page_3.png"
$src = [System.Drawing.Bitmap]::FromFile($p3)
$W = $src.Width
$H = $src.Height

# Exact coordinates for the Switch 2 Port Migration Diagram on Page 3
# X: 5% to 95% width (width = 90%)
# Y: 5.5% to 40% height (height = 34.5%)
$rect = New-Object System.Drawing.Rectangle(([int]($W * 0.05)), ([int]($H * 0.055)), ([int]($W * 0.90)), ([int]($H * 0.345)))
$crop = $src.Clone($rect, $src.PixelFormat)
$crop.Save("C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike287_migration_diagram.png", [System.Drawing.Imaging.ImageFormat]::Png)
$crop.Dispose()
$src.Dispose()
Write-Host "Cropped nike287_migration_diagram.png successfully!"
