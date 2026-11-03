$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Add mobile nav-logo margin rule to the 992px media query
$old = '.nav-links,.nav-dropdown{display:none!important}'
$new = '.nav-links,.nav-dropdown{display:none!important}' + "`n    .nav-logo{margin-left:auto;margin-right:.75rem}"

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    [System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
    Write-Output "done"
} else {
    Write-Output "ERROR: pattern not found"
}
