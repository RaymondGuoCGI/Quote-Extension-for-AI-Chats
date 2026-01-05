# Chrome Web Store 打包脚本
# 此脚本会创建一个用于发布到 Chrome Web Store 的 ZIP 文件

# 设置输出文件名
$outputZip = "quote-extension-v1.0.0.zip"

# 要包含的文件和文件夹
$filesToInclude = @(
    "manifest.json",
    "content.js",
    "popup.html",
    "popup.js",
    "styles.css",
    "icons"
)

# 临时目录
$tempDir = "temp_package"

Write-Host "开始打包 Quote Extension..." -ForegroundColor Green

# 如果临时目录存在，先删除
if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force
}

# 创建临时目录
New-Item -ItemType Directory -Path $tempDir | Out-Null

# 复制文件到临时目录
foreach ($item in $filesToInclude) {
    if (Test-Path $item) {
        if (Test-Path $item -PathType Container) {
            # 如果是文件夹，递归复制
            Copy-Item -Path $item -Destination $tempDir -Recurse
            Write-Host "✓ 已复制文件夹: $item" -ForegroundColor Cyan
        } else {
            # 如果是文件，直接复制
            Copy-Item -Path $item -Destination $tempDir
            Write-Host "✓ 已复制文件: $item" -ForegroundColor Cyan
        }
    } else {
        Write-Host "✗ 文件不存在: $item" -ForegroundColor Red
    }
}

# 删除旧的 ZIP 文件（如果存在）
if (Test-Path $outputZip) {
    Remove-Item -Path $outputZip -Force
    Write-Host "已删除旧的 ZIP 文件" -ForegroundColor Yellow
}

# 创建 ZIP 文件
Write-Host "`n正在创建 ZIP 文件..." -ForegroundColor Green
Compress-Archive -Path "$tempDir\*" -DestinationPath $outputZip

# 清理临时目录
Remove-Item -Path $tempDir -Recurse -Force

# 获取 ZIP 文件大小
$zipSize = (Get-Item $outputZip).Length / 1KB

Write-Host "`n✓ 打包完成！" -ForegroundColor Green
Write-Host "文件名: $outputZip" -ForegroundColor Cyan
Write-Host "文件大小: $([math]::Round($zipSize, 2)) KB" -ForegroundColor Cyan
Write-Host "`n下一步:" -ForegroundColor Yellow
Write-Host "1. 访问 Chrome Web Store 开发者控制台" -ForegroundColor White
Write-Host "   https://chrome.google.com/webstore/devconsole" -ForegroundColor Gray
Write-Host "2. 点击 '新增项目' 并上传 $outputZip" -ForegroundColor White
Write-Host "3. 填写商店列表信息" -ForegroundColor White
Write-Host "4. 提交审核" -ForegroundColor White
Write-Host "`n祝你发布顺利！🎉" -ForegroundColor Green
