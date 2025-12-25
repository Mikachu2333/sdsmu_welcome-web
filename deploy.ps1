[System.Console]::OutputEncoding = [System.Console]::InputEncoding = [System.Text.Encoding]::UTF8

# 遇到错误时停止执行
$ErrorActionPreference = "Stop"

# 1. 构建项目
Write-Host "正在构建项目..."
npm run docs:build

# 2. 进入构建输出目录
$distPath = "md_files/.vuepress/dist"
if (-not (Test-Path $distPath)) {
    Write-Error "构建目录 $distPath 不存在！"
    exit 1
}
Push-Location $distPath

# 3. 初始化临时 Git 仓库并提交
Write-Host "正在提交构建产物..."
git init
git-config-user.bat
git add -A
git commit -m "deploy: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 4. 强制推送到远程 gh-pages 分支
# 注意：这里使用了 HTTPS 链接，如果需要 SSH 请自行修改
$repoUrl = "https://github.com/Mikachu2333/sdsmu_welcome-web.git"
Write-Host "正在推送到 $repoUrl 的 gh-pages 分支..."

# 将本地的 master (或 main) 分支推送到远程的 gh-pages 分支
git push -f $repoUrl master:gh-pages

# 5. 恢复目录位置
Pop-Location

Write-Host "部署完成！"
