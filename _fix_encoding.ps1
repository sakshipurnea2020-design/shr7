$file = "shreyanamankan-v2/global-scholarships.html"
$c = [System.IO.File]::ReadAllText((Resolve-Path $file), [System.Text.Encoding]::UTF8)

# Fix nav logo star
$c = $c.Replace('<span>?</span>', '<span>&#10022;</span>')

# Fix hero badge emoji (trophy)
$c = $c.Replace('<div class="badge">?? Scholarship Directory 2026</div>', '<div class="badge">&#127942; Scholarship Directory 2026</div>')
$c = $c.Replace('<div class="badge">?? Scholarship Directory 2025</div>', '<div class="badge">&#127942; Scholarship Directory 2026</div>')

# Fix cover card icons
$c = $c.Replace('<div class="cover-icon">??</div><h4>Tuition</h4>', '<div class="cover-icon">&#127891;</div><h4>Tuition</h4>')
$c = $c.Replace('<div class="cover-icon">??</div><h4>Living Costs</h4>', '<div class="cover-icon">&#128176;</div><h4>Living Costs</h4>')
$c = $c.Replace('<div class="cover-icon">??</div><h4>Travel</h4>', '<div class="cover-icon">&#9992;&#65039;</div><h4>Travel</h4>')
$c = $c.Replace('<div class="cover-icon">???</div><h4>Extras</h4>', '<div class="cover-icon">&#128737;&#65039;</div><h4>Extras</h4>')

# Fix explore button arrow
$c = $c.Replace('>Explore Scholarships ?</a>', '>Explore Scholarships &#8595;</a>')

# Fix region tags
$c = $c.Replace('<div class="region-tag">?? Most Competitive</div>', '<div class="region-tag">&#11088; Most Competitive</div>')
$c = $c.Replace('<div class="region-tag">?? Americas &amp; Canada</div>', '<div class="region-tag">&#127758; Americas &amp; Canada</div>')
$c = $c.Replace('<div class="region-tag">?? Asia-Pacific &amp; Beyond</div>', '<div class="region-tag">&#127759; Asia-Pacific &amp; Beyond</div>')

# Fix rupee symbols - replace ? with ₹ HTML entity
$c = $c.Replace('?1.3L', '&#8377;1.3L')
$c = $c.Replace('?85K', '&#8377;85K')
$c = $c.Replace('?8L', '&#8377;8L')
$c = $c.Replace('(~?1.3L)', '(~&#8377;1.3L)')
$c = $c.Replace('(~?85K)', '(~&#8377;85K)')

# Fix euro/yen symbols that became ?
$c = $c.Replace('?1,400/month', '&#8364;1,400/month')
$c = $c.Replace('?144,000?145,000/month', '&#165;144,000&#8211;145,000/month')
$c = $c.Replace('12?24 months', '12&#8211;24 months')

# Fix any remaining ? before numbers that are likely currency
$c = $c -replace '\?(\d)', '&#8377;$1'

[System.IO.File]::WriteAllText((Resolve-Path $file), $c, [System.Text.UTF8Encoding]::new($false))
Write-Output "done"
