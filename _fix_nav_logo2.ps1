$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Remove the margin-left:auto that was pushing logo to the right
$c = $c.Replace(".nav-links,.nav-dropdown{display:none!important}`n    .nav-logo{margin-left:auto;margin-right:.75rem}", ".nav-links,.nav-dropdown{display:none!important}")

# Ensure nav-logo stays on the left on mobile (it already is by default in flex row)
# Just reset any margin that might have been added
if ($c.Contains(".nav-logo{margin-left:auto")) {
    $c = $c -replace '\.nav-logo\{margin-left:auto[^}]*\}', ''
    Write-Output "removed stray margin rule"
}

[System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
Write-Output "done"
