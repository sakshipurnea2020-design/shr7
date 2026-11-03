$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Fix "? Back to Home" - replace broken char with arrow
$c = $c -replace '\? Back to Home', '← Back to Home'

# Fix "?? Action Plan" - replace broken chars with target emoji
$c = $c -replace '\?\? Action Plan', '🎯 Action Plan'

# Fix "? Back to Main Site" - replace broken char with arrow
$c = $c -replace '\? Back to Main Site', '← Back to Main Site'

# Fix search placeholder broken emoji
$c = $c -replace '\?\?  Search scholarships', '🔍 Search scholarships'

Set-Content $file $c -NoNewline
Write-Output "done"
