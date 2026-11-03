$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw
$imgStyle = 'style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block"'

# Japan ADB card
$c = $c.Replace(
    '<span class="schol-dest">Japan / ADB</span><img src="https://flagcdn.com/w160/jp.png" alt="Asia" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Japan / ADB</span><img src=`"japanmext.jpeg`" alt=`"Japan`" $imgStyle>"
)

# Japan World Bank card
$c = $c.Replace(
    '<span class="schol-dest">Japan / World Bank</span><img src="https://flagcdn.com/w160/jp.png" alt="Asia" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Japan / World Bank</span><img src=`"japanmext.jpeg`" alt=`"Japan`" $imgStyle>"
)

Set-Content $file $c -NoNewline
Write-Output "done"
