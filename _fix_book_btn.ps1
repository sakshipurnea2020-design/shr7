$guides = @(
    "shreyanamankan-v2/uk-guide.html",
    "shreyanamankan-v2/usa-guide.html",
    "shreyanamankan-v2/canada-guide.html",
    "shreyanamankan-v2/australia-guide.html",
    "shreyanamankan-v2/europe-guide.html",
    "shreyanamankan-v2/singapore-guide.html",
    "shreyanamankan-v2/new-zealand-guide.html",
    "shreyanamankan-v2/others-guide.html"
)

# The new small top-right button to inject into hero section
$heroBtn = '  <a href="inquiry.html" style="position:absolute;top:1rem;right:1.5rem;z-index:10;background:var(--gold);color:var(--ink);padding:.35rem .9rem;border-radius:50px;font-weight:700;font-size:.78rem;white-space:nowrap;text-decoration:none;letter-spacing:.3px">Book Counselling</a>'

foreach ($f in $guides) {
    $c = [System.IO.File]::ReadAllText((Resolve-Path $f), [System.Text.Encoding]::UTF8)
    
    # 1. Remove the Book Counselling from nav-links
    $c = $c -replace '<a href="inquiry\.html" style="background:var\(--gold\);color:var\(--ink\);padding:\.4rem 1rem;border-radius:50px;font-weight:600">Book Counselling</a>', ''
    
    # 2. Make hero section position:relative if not already, then inject button
    # Find <section class="hero"> and add position:relative + the button inside
    if ($c.Contains('<section class="hero">')) {
        $c = $c.Replace('<section class="hero">', '<section class="hero" style="position:relative">')
        # Inject button right after opening hero tag
        $c = $c.Replace('<section class="hero" style="position:relative">', '<section class="hero" style="position:relative">' + "`n" + $heroBtn)
        [System.IO.File]::WriteAllText((Resolve-Path $f), $c, [System.Text.UTF8Encoding]::new($false))
        Write-Output "Fixed: $f"
    } else {
        Write-Output "No hero section found: $f"
    }
}
