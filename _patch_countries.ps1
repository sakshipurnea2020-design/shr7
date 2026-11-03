$file = "shreyanamankan-v2/global-scholarships.html"
$c = Get-Content $file -Raw
$imgStyle = 'style="width:100%;height:160px;object-fit:cover;border-radius:8px;margin:.5rem 0 .75rem;display:block"'

# Ireland
$c = $c.Replace(
    '<span class="schol-dest">Ireland</span><img src="europe.jpeg" alt="Ireland" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Ireland</span><img src=`"ireland.jpeg`" alt=`"Ireland`" $imgStyle>"
)

# France
$c = $c.Replace(
    '<span class="schol-dest">France</span><img src="https://flagcdn.com/w160/fr.png" alt="France" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">France</span><img src=`"france.jpeg`" alt=`"France`" $imgStyle>"
)

# Sweden
$c = $c.Replace(
    '<span class="schol-dest">Sweden</span><img src="europe.jpeg" alt="Sweden" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Sweden</span><img src=`"sweden.jpeg`" alt=`"Sweden`" $imgStyle>"
)

# Italy - two cards, replace both
$c = $c.Replace(
    '<span class="schol-dest">Italy</span><img src="https://flagcdn.com/w160/it.png" alt="Italy" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Italy</span><img src=`"italy.jpeg`" alt=`"Italy`" $imgStyle>"
)

# Switzerland
$c = $c.Replace(
    '<span class="schol-dest">Switzerland</span><img src="https://flagcdn.com/w160/ch.png" alt="Switzerland" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Switzerland</span><img src=`"switzerland.jpeg`" alt=`"Switzerland`" $imgStyle>"
)

# Belgium - two cards, replace both
$c = $c.Replace(
    '<span class="schol-dest">Belgium</span><img src="https://flagcdn.com/w160/be.png" alt="Belgium" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Belgium</span><img src=`"belgium.jpeg`" alt=`"Belgium`" $imgStyle>"
)
$c = $c.Replace(
    '<span class="schol-dest">Belgium Flanders</span><img src="https://flagcdn.com/w160/be.png" alt="Belgium" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">Belgium Flanders</span><img src=`"belgium.jpeg`" alt=`"Belgium`" $imgStyle>"
)

# China
$c = $c.Replace(
    '<span class="schol-dest">China</span><img src="https://flagcdn.com/w160/cn.png" alt="China" class="schol-flag" loading="lazy">',
    "<span class=`"schol-dest`">China</span><img src=`"china.jpeg`" alt=`"China`" $imgStyle>"
)

Set-Content $file $c -NoNewline
Write-Output "done"
