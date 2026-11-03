$heroBtn = '  <a href="inquiry.html" style="position:absolute;top:1rem;right:1.5rem;z-index:10;background:var(--gold);color:var(--ink);padding:.35rem .9rem;border-radius:50px;font-weight:700;font-size:.78rem;white-space:nowrap;text-decoration:none;letter-spacing:.3px">Book Counselling</a>'

# Europe guide
$f = "shreyanamankan-v2/europe-guide.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $f), [System.Text.Encoding]::UTF8)
$c = $c -replace '<a href="inquiry\.html" style="background:var\(--gold\);color:var\(--ink\);padding:\.4rem 1rem;border-radius:50px;font-weight:600">Book Counselling</a>', ''
$old = '<section class="hero" style="padding:0;background:#fff;">'
$new = '<section class="hero" style="padding:0;background:#fff;position:relative;">' + "`n" + $heroBtn
$c = $c.Replace($old, $new)
[System.IO.File]::WriteAllText((Resolve-Path $f), $c, [System.Text.UTF8Encoding]::new($false))
Write-Output "Fixed europe-guide"

# Others guide
$f = "shreyanamankan-v2/others-guide.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $f), [System.Text.Encoding]::UTF8)
$c = $c -replace '<a href="inquiry\.html" style="background:var\(--gold\);color:var\(--ink\);padding:\.4rem 1rem;border-radius:50px;font-weight:600">Book Counselling</a>', ''
# Find hero opening tag variant
$m = [regex]::Match($c, '<section[^>]*class="hero"[^>]*>')
if ($m.Success) {
    $heroTag = $m.Value
    # Add position:relative if not already there
    if ($heroTag -notmatch 'position:relative') {
        $newHeroTag = $heroTag -replace '>$', ' style="position:relative">'
        if ($heroTag -match 'style=') { $newHeroTag = $heroTag -replace 'style="([^"]*)"', 'style="$1;position:relative"' }
        $c = $c.Replace($heroTag, $newHeroTag + "`n" + $heroBtn)
    }
    [System.IO.File]::WriteAllText((Resolve-Path $f), $c, [System.Text.UTF8Encoding]::new($false))
    Write-Output "Fixed others-guide"
} else {
    Write-Output "No hero tag found in others-guide"
}
