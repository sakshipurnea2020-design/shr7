$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Insert logo image before the nav-logo text link
$oldHtml = '  <div class="nav-inner">' + "`n    " + '<a href="#" class="nav-logo"'
$newHtml = '  <div class="nav-inner">' + "`n    " + '<img src="logo.jpeg" alt="" class="nav-logo-img" style="display:none;height:36px;width:36px;object-fit:cover;border-radius:6px;flex-shrink:0;margin-right:.5rem">' + "`n    " + '<a href="#" class="nav-logo"'

if ($c.Contains($oldHtml)) {
    $c = $c.Replace($oldHtml, $newHtml)
    Write-Output "HTML updated"
} else {
    Write-Output "ERROR: nav-inner pattern not found - trying raw insert"
    $c = $c.Replace('<a href="#" class="nav-logo"', '<img src="logo.jpeg" alt="" class="nav-logo-img" style="display:none;height:36px;width:36px;object-fit:cover;border-radius:6px;flex-shrink:0;margin-right:.5rem"><a href="#" class="nav-logo"')
    Write-Output "done fallback"
}

[System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
Write-Output "saved"
