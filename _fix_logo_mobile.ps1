$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Add hero-logo-overlay hide rule to the existing 600px media query block
$old = '.hero-motto{font-size:1.173rem!important}.services-grid{grid-template-columns:1fr}'
$new = '.hero-logo-overlay{display:none!important}.hero-motto{font-size:1.173rem!important}.services-grid{grid-template-columns:1fr}'

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    [System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
    Write-Output "done"
} else {
    Write-Output "ERROR: pattern not found"
}
