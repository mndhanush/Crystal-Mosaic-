$files = @(
    "index.html",
    "home-2.html",
    "about.html",
    "gallery.html",
    "product.html",
    "restoration.html",
    "classes.html",
    "workshop.html",
    "faq.html",
    "pricing.html",
    "contact.html",
    "login.html",
    "register.html"
)

$basePath = "d:\GrowwPark projects\Crystal Mosaic"

$oldScript = @'
      function updateThemeIcons() {
        const isDark = html.classList.contains('dark');
        const themeIcon = document.getElementById('theme-icon');
        if (themeIcon) themeIcon.className = isDark ? 'fas fa-sun text-sm' : 'fas fa-moon text-sm';
        const mobileThemeIcon = document.getElementById('mobile-theme-icon');
        const mobileThemeText = document.getElementById('mobile-theme-text');
        if (mobileThemeIcon) mobileThemeIcon.className = isDark ? 'fas fa-sun text-sm' : 'fas fa-moon text-sm';
        if (mobileThemeText) mobileThemeText.textContent = isDark ? 'Light Mode' : 'Dark Mode';
      }
'@

$newScript = @'
      function updateThemeIcons() {
        const isDark = html.classList.contains('dark');
        const themeIcon = document.getElementById('theme-icon');
        if (themeIcon) themeIcon.className = isDark ? 'fas fa-moon text-sm' : 'fas fa-sun text-sm';
        const mobileThemeIcon = document.getElementById('mobile-theme-icon');
        const mobileThemeText = document.getElementById('mobile-theme-text');
        if (mobileThemeIcon) mobileThemeIcon.className = isDark ? 'fas fa-moon text-sm' : 'fas fa-sun text-sm';
        if (mobileThemeText) mobileThemeText.textContent = isDark ? 'Dark Mode' : 'Light Mode';
      }
'@

foreach ($file in $files) {
    $filePath = Join-Path $basePath $file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        if ($content.Contains($oldScript)) {
            $content = $content.Replace($oldScript, $newScript)
            Set-Content $filePath -Value $content -NoNewline
            Write-Host "Updated JS in: $file"
        } else {
            Write-Host "Skipped: $file (pattern not found)"
        }
    }
}
