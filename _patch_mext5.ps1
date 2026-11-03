$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

$old = '<span class="schol-dest">Japan</span><h3>MEXT Scholarship</h3>'
$new = '<span class="schol-dest">Japan</span><img src="japan mext.jpeg" alt="MEXT Japan Scholarship" style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block"><h3>MEXT Scholarship</h3>'

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    Set-Content $file $c -NoNewline
    Write-Output "done"
} else {
    Write-Output "ERROR"
}
