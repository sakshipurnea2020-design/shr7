$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Add mobile fixes to the 600px media query
$old = '.hero-logo-overlay{display:none!important}.hero-motto{font-size:1.173rem!important}.services-grid{grid-template-columns:1fr}'
$new = '.hero-logo-overlay{display:none!important}.hero-motto{font-size:1.173rem!important}.services-grid{grid-template-columns:1fr}.btn{white-space:normal;text-align:center}.country-cta-bar{flex-direction:column;gap:.75rem}.country-cta-bar .btn{width:100%;max-width:320px;justify-content:center}.hwh-two-col{grid-template-columns:1fr!important}.about-grid{grid-template-columns:1fr!important}.process-step-summary{grid-template-columns:56px 1fr!important;gap:1rem!important;padding:1.25rem!important}.ps-content{padding:.25rem 1rem 1.25rem!important}'

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    [System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
    Write-Output "done"
} else {
    Write-Output "ERROR: pattern not found"
    # Try to find what's actually there
    if ($c.Contains('hero-logo-overlay')) { Write-Output "hero-logo-overlay found" }
    if ($c.Contains('hero-motto')) { Write-Output "hero-motto found" }
}
