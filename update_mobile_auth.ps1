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
    "contact.html"
)

$basePath = "d:\GrowwPark projects\Crystal Mosaic"

# Regex pattern that ignores exact whitespace/newlines between tags
$pattern = '(?s)(<!-- Mobile Auth & Toggles -->\s*<div class="pt-6 flex flex-col gap-4">\s*)<a href="login.html"[^>]*>\s*Login\s*</a>\s*<a href="register.html"[^>]*>\s*Register\s*</a>'

$replacement = '$1<div class="grid grid-cols-2 gap-3">
              <a href="login.html" class="flex items-center justify-center w-full bg-transparent border-2 border-lead dark:border-white text-lead dark:text-white hover:border-amber hover:text-amber dark:hover:border-amber dark:hover:text-amber px-2 py-3 rounded-full font-medium uppercase tracking-widest text-[11px] sm:text-xs transition duration-300">
                Login
              </a>
              <a href="register.html" class="flex items-center justify-center w-full bg-amber text-black hover:bg-lead hover:text-white dark:hover:bg-white dark:hover:text-black px-2 py-3 rounded-full font-medium uppercase tracking-widest text-[11px] sm:text-xs transition duration-300">
                Register
              </a>
            </div>'

foreach ($file in $files) {
    $filePath = Join-Path $basePath $file
    $content = Get-Content $filePath -Raw
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $replacement
        Set-Content $filePath -Value $content -NoNewline
        Write-Host "Updated: $file"
    } else {
        Write-Host "Skipped: $file (pattern not found)"
    }
}
