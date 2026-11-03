$guides = @(
    "shreyanamankan-v2/uk-guide.html",
    "shreyanamankan-v2/usa-guide.html",
    "shreyanamankan-v2/canada-guide.html",
    "shreyanamankan-v2/australia-guide.html",
    "shreyanamankan-v2/europe-guide.html",
    "shreyanamankan-v2/singapore-guide.html",
    "shreyanamankan-v2/new-zealand-guide.html",
    "shreyanamankan-v2/others-guide.html"
)

$mobileFix = "@media(max-width:600px){.btng,.btnw{white-space:normal;text-align:center;width:100%;margin-left:0;justify-content:center;font-size:.88rem}.btnw{margin-left:0;margin-top:.5rem}.guide-cta .c{display:flex;flex-direction:column;gap:.75rem;align-items:stretch}}"

foreach ($f in $guides) {
    $c = [System.IO.File]::ReadAllText((Resolve-Path $f), [System.Text.Encoding]::UTF8)
    
    # Add the mobile fix before </style>
    if (-not $c.Contains("white-space:normal") -and $c.Contains("</style>")) {
        $c = $c.Replace("</style>", $mobileFix + "`n</style>")
        [System.IO.File]::WriteAllText((Resolve-Path $f), $c, [System.Text.UTF8Encoding]::new($false))
        Write-Output "Fixed: $f"
    } else {
        Write-Output "Skipped (already fixed or no style tag): $f"
    }
}
