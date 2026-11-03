$file = "shreyanamankan-v2/index.html"
$lines = Get-Content $file -Encoding UTF8

# Find start of NAV comment and end of </nav>
$startLine = -1
$endLine = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($startLine -eq -1 -and $lines[$i] -match '<!-- NAV -->') {
        $startLine = $i
    }
    if ($startLine -ne -1 -and $endLine -eq -1 -and $lines[$i] -match '</nav>' -and $i -gt $startLine) {
        $endLine = $i
        break
    }
}

Write-Output "Nav start: $startLine, end: $endLine"

$cleanNav = @'
<!-- NAV -->
<nav class="site-nav" role="navigation" aria-label="Main navigation">
  <div class="nav-inner">
    <a href="index.html" class="nav-logo" aria-label="Shreya Namankan home">Shreya Namankan <span>&#10022;</span></a>
    <div class="nav-links" id="nav-links">
      <a href="#about">About</a>
      <a href="#countries">Countries</a>
      <a href="#services">Services</a>
      <a href="#process">How It Works</a>
      <a href="#community">Community</a>
      <a href="english-language-tests.html">English Tests</a>
      <a href="education-loan.html">Education Loan</a>
      <a href="global-scholarships.html">Scholarships</a>
      <div class="nav-dropdown" id="nav-uni-dd">
        <button class="nav-dropdown-btn" onclick="toggleUniDD(event)" aria-haspopup="true" aria-expanded="false">Universities <span class="dd-arrow">&#9660;</span></button>
        <div class="nav-dropdown-menu" role="menu">
          <div class="nav-dd-top">
            <h4>&#127891; Study Destinations</h4>
            <p>8 countries, Europe guide, 400+ universities</p>
          </div>
          <a href="universities.html" class="nav-dd-browse">&#127758; Browse All Destinations &#8594;</a>
          <div class="nav-dd-header">Select a Destination</div>
          <div class="nav-dd-grid">
            <a href="universities-country.html?country=uk">&#127468;&#127463; United Kingdom</a>
            <a href="universities-country.html?country=usa">&#127482;&#127480; United States</a>
            <a href="europe-guide.html">&#127466;&#127482; Europe</a>
            <a href="universities-country.html?country=canada">&#127464;&#127462; Canada</a>
            <a href="universities-country.html?country=australia">&#127462;&#127482; Australia</a>
            <a href="universities-country.html?country=new-zealand">&#127475;&#127487; New Zealand</a>
            <a href="universities-country.html?country=singapore">&#127480;&#127468; Singapore</a>
            <a href="others-guide.html">&#127760; Others</a>
          </div>
        </div>
      </div>
      <a href="#contact" class="btn btn-primary nav-cta desktop-only">Contact</a>
    </div>
    <img src="logo.jpeg" alt="Shreya Namankan Logo" style="height:48px;width:auto;object-fit:contain;border-radius:6px;flex-shrink:0;margin-left:.75rem;display:block" loading="eager">
    <button class="hamburger" id="hamburger-btn" aria-label="Open menu" aria-expanded="false" aria-controls="mobile-menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</nav>

<!-- MOBILE MENU -->
<div class="mobile-menu" id="mobile-menu" role="navigation" aria-label="Mobile navigation" aria-hidden="true">
  <a href="#about">About</a>
  <a href="#countries">Countries</a>
  <a href="#services">Services</a>
  <a href="#process">How It Works</a>
  <a href="#community">Community</a>
  <a href="english-language-tests.html">English Tests</a>
  <a href="education-loan.html">Education Loan</a>
  <a href="global-scholarships.html">Scholarships</a>
  <a href="universities.html" style="color:var(--gold)!important;font-weight:700">Universities</a>
  <a href="universities-country.html?country=uk" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; United Kingdom</a>
  <a href="universities-country.html?country=usa" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; United States</a>
  <a href="europe-guide.html" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; Europe</a>
  <a href="universities-country.html?country=canada" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; Canada</a>
  <a href="universities-country.html?country=australia" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; Australia</a>
  <a href="universities-country.html?country=new-zealand" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; New Zealand</a>
  <a href="universities-country.html?country=singapore" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; Singapore</a>
  <a href="others-guide.html" style="padding-left:2rem;font-size:.88rem;opacity:.8">&#8627; Others</a>
  <a href="#contact">Contact</a>
  <a href="inquiry.html" class="btn btn-primary" style="margin:1rem 1.5rem;width:calc(100% - 3rem);text-align:center;justify-content:center">Book Free Evaluation</a>
</div>
'@

$before = $lines[0..($startLine - 1)]
$after = $lines[($endLine + 1)..($lines.Count - 1)]
$newContent = ($before + ($cleanNav -split "`n") + $after) -join "`n"
[System.IO.File]::WriteAllText((Resolve-Path $file), $newContent, [System.Text.Encoding]::UTF8)
Write-Output "Done. Replaced lines $startLine to $endLine"
