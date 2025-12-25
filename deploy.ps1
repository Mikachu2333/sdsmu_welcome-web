# Stop execution on error
$ErrorActionPreference = "Stop"

# 1. Build project
Write-Host "Building project..."
npm run docs:build

# 2. Enter build output directory
$distPath = "md_files/.vuepress/dist"
if (-not (Test-Path $distPath)) {
    Write-Error "Build directory $distPath does not exist!"
    exit 1
}
Push-Location $distPath

# 3. Initialize temporary Git repository and commit
Write-Host "Committing build artifacts..."
git init
git-config-user.bat
git add -A
git commit -m "deploy: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 4. Force push to remote gh-pages branch
# Note: Using HTTPS link. Modify if SSH is needed.
$repoUrl = "https://github.com/Mikachu2333/sdsmu_welcome-web.git"
Write-Host "Pushing to gh-pages branch of $repoUrl..."

# Push local master (or main) branch to remote gh-pages branch
git push -f $repoUrl master:gh-pages

# 5. 恢复目录位置
Pop-Location

Write-Host "Deployment complete!"
