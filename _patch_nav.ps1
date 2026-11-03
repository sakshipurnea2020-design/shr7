$file = "shreyanamankan-v2/index.html"
$c = Get-Content $file -Raw

# Remove all "Countries" nav links (desktop + mobile)
$c = $c -replace '<a href="#countries">Countries</a>\r?\n', ''
$c = $c -replace '<a href="#countries">Countries</a>', ''

# Rename all "Community" nav links to "Testimonials"
$c = $c -replace '<a href="#community">Community</a>', '<a href="#community">Testimonials</a>'

Set-Content $file $c -NoNewline
Write-Output "done"
