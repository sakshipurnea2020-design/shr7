$file = "shreyanamankan-v2/index.html"
$c = Get-Content $file -Raw

# Step 1: Add hero-motto class to the element
$c = $c -replace 'class="hero-badge" style="font-size:1\.275rem', 'class="hero-badge hero-motto" style="font-size:1.275rem'

# Step 2: Add CSS rule after hero-logo-overlay rule (try both LF and CRLF)
if ($c.Contains(".hero-logo-overlay{display:none!important}`n")) {
    $c = $c -replace [regex]::Escape(".hero-logo-overlay{display:none!important}`n"), ".hero-logo-overlay{display:none!important}`n  .hero-motto{font-size:1.173rem!important}`n"
    Write-Output "CSS added (LF)"
} elseif ($c.Contains(".hero-logo-overlay{display:none!important}`r`n")) {
    $c = $c -replace [regex]::Escape(".hero-logo-overlay{display:none!important}`r`n"), ".hero-logo-overlay{display:none!important}`r`n  .hero-motto{font-size:1.173rem!important}`r`n"
    Write-Output "CSS added (CRLF)"
} else {
    Write-Output "WARNING: hero-logo-overlay rule not found, inserting before .services-grid"
    $c = $c -replace '(@media\(max-width:600px\)\{[^\}]*?)\.services-grid', '$1.hero-motto{font-size:1.173rem!important}.services-grid'
}

Set-Content $file $c -NoNewline
Write-Output "saved"
