$pdfPath = "C:\Users\11071121\.gemini\antigravity\brain\9898563f-9afa-474a-8d2b-1876ba97dec3\.user_uploaded\media_1787559690202.pdf"
$bytes = [System.IO.File]::ReadAllBytes($pdfPath)
$count = 0

for ($i = 0; $i -lt $bytes.Length - 3; $i++) {
    if ($bytes[$i] -eq 0xFF -and $bytes[$i+1] -eq 0xD8 -and $bytes[$i+2] -eq 0xFF) {
        for ($j = $i + 3; $j -lt $bytes.Length - 1; $j++) {
            if ($bytes[$j] -eq 0xFF -and $bytes[$j+1] -eq 0xD9) {
                $len = ($j + 2) - $i
                if ($len -gt 5000) {
                    $count++
                    $imgBytes = New-Object byte[] $len
                    [Array]::Copy($bytes, $i, $imgBytes, 0, $len)
                    $outPath = "C:\Users\11071121\.gemini\antigravity\scratch\nomad-it\assets\nike_real_$count.jpg"
                    [System.IO.File]::WriteAllBytes($outPath, $imgBytes)
                    Write-Host "Extracted JPEG $count ($len bytes) -> $outPath"
                    $i = $j + 2
                    break
                }
            }
        }
    }
}
