$file = "shreyanamankan-v2/index.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Add mobile nav logo image before the hamburger button (inside nav-inner)
# Current: <a href="#" class="nav-logo"...>Shreya Namankan <span>✦</span></a>
# We add a mobile-only logo image right before the hamburger, and push text name to right

# Add CSS rule to mobile media query to make name go to right and show logo img
$oldCss = '.nav-links,.nav-dropdown{display:none!important}'
$newCss = '.nav-links,.nav-dropdown{display:none!important}' + "`n    .nav-logo{order:3;margin-left:auto}" + "`n    .nav-logo-img{display:block!important}"

if ($c.Contains($oldCss)) {
    $c = $c.Replace($oldCss, $newCss)
} 

# Add hidden-by-default logo img into nav HTML, visible only on mobile
$oldNav = '<a href="#" class="nav-logo" aria-label="Shreya Namankan home">Shreya Namankan <span>&#10022;</span></a>'
$newNav = '<img src="logo.jpeg" alt="Shreya Namankan Logo" class="nav-logo-img" style="display:none;height:36px;width:36px;object-fit:cover;border-radius:6px;flex-shrink:0">' + "`n    " + '<a href="#" class="nav-logo" aria-label="Shreya Namankan home">Shreya Namankan <span>&#10022;</span></a>'

if ($c.Contains($oldNav)) {
    $c = $c.Replace($oldNav, $newNav)
    Write-Output "nav updated"
} else {
    # Try alternate quote style
    $oldNav2 = '<a href="#" class="nav-logo" aria-label="Shreya Namankan home">Shreya Namankan <span>' + [char]0x2756 + '</span></a>'
    Write-Output "trying alternate..."
}

[System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
Write-Output "done"
