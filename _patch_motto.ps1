$file = "shreyanamankan-v2/index.html"
$c = Get-Content $file -Raw
$old = "  .hero-logo-overlay{display:none!important}`r`n  .services-grid"
$new = "  .hero-logo-overlay{display:none!important}`r`n  .hero-motto{font-size:1.173rem!important}`r`n  .services-grid"
if ($c.Contains($old)) {
    $c = $c.Replace($old, $new)
    Set-Content $file $c -NoNewline
    Write-Output "done with CRLF"
} else {
    $old2 = "  .hero-logo-overlay{display:none!important}`n  .services-grid"
    $new2 = "  .hero-logo-overlay{display:none!important}`n  .hero-motto{font-size:1.173rem!important}`n  .services-grid"
    $c = $c.Replace($old2, $new2)
    Set-Content $file $c -NoNewline
    Write-Output "done with LF"
}
