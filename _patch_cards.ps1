$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw

# Fix 1: Japan MEXT card - update filename from "japan mext.jpeg" to "japanmext.jpeg" (new file)
$c = $c.Replace('src="japan mext.jpeg"', 'src="japanmext.jpeg"')

# Fix 2: South Korea GKS card - replace flag with south korea.jpeg, image before h3
$c = $c.Replace(
    '<span class="schol-dest">South Korea</span><img src="https://flagcdn.com/w160/jp.png" alt="Asia" class="schol-flag" loading="lazy">',
    '<span class="schol-dest">South Korea</span><img src="south korea.jpeg" alt="South Korea GKS Scholarship" style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block">'
)

Set-Content $file $c -NoNewline
Write-Output "done"
