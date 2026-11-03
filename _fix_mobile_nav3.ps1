$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Find the nav-logo anchor and prepend the logo image before it
# Use the aria-label as unique identifier
$target = 'class="nav-logo" aria-label="Shreya Namankan home"'
$imgTag = '<img src="logo.jpeg" alt="Shreya Namankan" class="nav-logo-img" style="display:none;height:36px;width:36px;object-fit:cover;border-radius:6px;flex-shrink:0">'

if ($c.Contains($target)) {
    # Find position of the opening < before class="nav-logo"
    $idx = $c.IndexOf('<a href=')
    # Find the specific one with nav-logo
    $pattern = '<a [^>]*class="nav-logo"[^>]*>'
    $match = [regex]::Match($c, $pattern)
    if ($match.Success) {
        $c = $c.Substring(0, $match.Index) + $imgTag + "`n    " + $c.Substring($match.Index)
        [System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
        Write-Output "done - inserted at index $($match.Index)"
    } else {
        Write-Output "ERROR: regex match failed"
    }
} else {
    Write-Output "ERROR: target not found"
}
