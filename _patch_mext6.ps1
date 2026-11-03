$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Remove the duplicate img line that was added previously
$dup = "`n        <img src=""japan mext.jpeg"" alt=""MEXT Japan Scholarship"" style=""width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block"">"
$c = $c.Replace($dup, "")

Set-Content $file $c -NoNewline
Write-Output "done"
