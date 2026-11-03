$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Remove the flag image from MEXT card specifically
# The flag: <img src="https://flagcdn.com/w160/jp.png" alt="Asia" class="schol-flag" loading="lazy">
$c = $c.Replace('<span class="schol-dest">Japan</span><img src="https://flagcdn.com/w160/jp.png" alt="Asia" class="schol-flag" loading="lazy"><h3>MEXT Scholarship</h3>', '<span class="schol-dest">Japan</span><h3>MEXT Scholarship</h3>')

# Also remove the duplicate japan mext.jpeg line added previously (the one after h3), keep only one
# The card now has japan mext.jpeg already, so just ensure no duplicate
Set-Content $file $c -NoNewline
Write-Output "done"
