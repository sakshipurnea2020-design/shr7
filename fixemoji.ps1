$baseStyle = 'color:rgba(255,255,255,.5);font-size:.8rem;text-decoration:none;border:1px solid rgba(255,255,255,.15);padding:.25rem .7rem;border-radius:50px;transition:color .2s'
$hov = "onmouseover=`"this.style.color='#e0b034'`" onmouseout=`"this.style.color='rgba(255,255,255,.5)'`""

$emojiStyle = "font-size:1.8rem;text-decoration:none;transition:transform .2s;display:inline-block;line-height:1"
$hov2 = "onmouseover=`"this.style.transform='scale(1.2)'`" onmouseout=`"this.style.transform='scale(1)'`""

$old_wa = "<a href=`"https://wa.me/918150035443`" target=`"_blank`" rel=`"noopener`" style=`"$baseStyle`" $hov>WhatsApp</a>"
$old_ig = "<a href=`"https://www.instagram.com/shreya_namankan`" target=`"_blank`" rel=`"noopener`" style=`"$baseStyle`" $hov>Instagram</a>"
$old_li = "<a href=`"https://www.linkedin.com/company/shreya-namankan/`" target=`"_blank`" rel=`"noopener`" style=`"$baseStyle`" $hov>LinkedIn</a>"
$old_fb = "<a href=`"https://www.facebook.com/profile.php?id=61572047660426`" target=`"_blank`" rel=`"noopener`" style=`"$baseStyle`" $hov>Facebook</a>"

$new_wa = "<a href=`"https://wa.me/918150035443`" target=`"_blank`" rel=`"noopener`" aria-label=`"WhatsApp`" title=`"WhatsApp`" style=`"$emojiStyle`" $hov2>&#128517;</a>"
$new_ig = "<a href=`"https://www.instagram.com/shreya_namankan`" target=`"_blank`" rel=`"noopener`" aria-label=`"Instagram`" title=`"Instagram`" style=`"$emojiStyle`" $hov2>&#128247;</a>"
$new_li = "<a href=`"https://www.linkedin.com/company/shreya-namankan/`" target=`"_blank`" rel=`"noopener`" aria-label=`"LinkedIn`" title=`"LinkedIn`" style=`"$emojiStyle`" $hov2>&#128188;</a>"
$new_fb = "<a href=`"https://www.facebook.com/profile.php?id=61572047660426`" target=`"_blank`" rel=`"noopener`" aria-label=`"Facebook`" title=`"Facebook`" style=`"$emojiStyle`" $hov2>&#128241;</a>"

$files = Get-ChildItem "$PSScriptRoot" -Filter "*.html" | Select-Object -ExpandProperty FullName

foreach ($f in $files) {
  $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
  if ($c.Contains('>WhatsApp</a>')) {
    $c = $c.Replace($old_wa, $new_wa)
    $c = $c.Replace($old_ig, $new_ig)
    $c = $c.Replace($old_li, $new_li)
    $c = $c.Replace($old_fb, $new_fb)
    [System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $(Split-Path $f -Leaf)"
  }
}
Write-Host "Done"
