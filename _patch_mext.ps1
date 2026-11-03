$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Find MEXT card and insert image after <h3>MEXT Scholarship</h3>
$old = '<h3>MEXT Scholarship</h3>'
$new = '<h3>MEXT Scholarship</h3>' + "`n        " + '<img src="japan mext.jpeg" alt="MEXT Japan Scholarship" style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block">'

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    Set-Content $file $c -NoNewline
    Write-Output "done"
} else {
    Write-Output "ERROR: MEXT h3 not found"
}
