$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Find and replace the MEXT card line - flag before h3, replace with image after h3
$old = '<span class="schol-dest">Japan</span><img src="https://flagcdn.com/w160/jp.png" alt="Japan" class="schol-flag" loading="lazy"><h3>MEXT Scholarship</h3>'
$new = '<span class="schol-dest">Japan</span><img src="japan mext.jpeg" alt="MEXT Japan Scholarship" style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block"><h3>MEXT Scholarship</h3>'

if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    Set-Content $file $c -NoNewline
    Write-Output "done"
} else {
    Write-Output "ERROR: exact string not found"
    # Debug: show what's on that line
    ($c -split "`n") | Select-String "schol-dest.*Japan"
}
