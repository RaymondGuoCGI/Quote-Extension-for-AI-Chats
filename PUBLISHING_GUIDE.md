# Chrome Web Store 发布指南

本指南将帮助你将 Quote Extension 发布到 Chrome Web Store。

## 📋 发布前准备清单

### ✅ 已完成的准备工作

- [x] 扩展功能完整且正常工作
- [x] 所有必需的图标文件（16x16, 32x32, 48x48, 128x128）
- [x] manifest.json 配置完整
- [x] README 文档完善

### 📝 还需要准备的素材

在发布到 Chrome Web Store 之前，你需要准备以下额外的素材：

#### 1. 商店展示图片

**必需的图片**：
- **小型宣传图块**（Small promo tile）：440x280 像素
- **大型宣传图块**（Large promo tile）：920x680 像素（可选但推荐）
- **截图**：至少 1 张，最多 5 张
  - 尺寸：1280x800 或 640x400 像素
  - 建议使用你已有的 `screenshots/demo-effect-new.png` 和 `screenshots/toggle-switch.png`

#### 2. 商店列表信息

准备以下文本内容：

**详细说明**（中文版）：
```
Quote Extension 是一款专为 AI 聊天平台设计的浏览器扩展，让你能够优雅地引用网页文本并在 AI 对话中使用。

🎯 主要功能：
• 一键引用：选中任意网页文本，点击"Quote"按钮即可引用
• 智能格式化：自动将引用文本格式化为美观的引用块
• 全平台支持：兼容 Gemini、ChatGPT、Claude 等所有 AI 聊天平台
• 智能识别：自动识别页面中的输入框，无需手动配置
• 开关控制：通过扩展图标快速启用/禁用功能

💡 使用方法：
1. 在任意网页上选中你想引用的文本
2. 点击出现的"Quote"按钮
3. 在 AI 聊天输入框中输入你的问题
4. 按 Enter 发送，引用和问题会自动格式化显示

⚙️ 技术特点：
• 零依赖，纯 JavaScript 实现
• 轻量级，不影响页面性能
• 开源项目，代码透明可信

适用于所有需要在 AI 对话中引用网页内容的用户。
```

**详细说明**（英文版）：
```
Quote Extension is a browser extension designed specifically for AI chat platforms, allowing you to elegantly quote web text and use it in AI conversations.

🎯 Key Features:
• One-Click Quote: Select any web text and click the "Quote" button
• Smart Formatting: Automatically formats quoted text into beautiful quote blocks
• Universal Support: Compatible with Gemini, ChatGPT, Claude, and all AI chat platforms
• Smart Detection: Automatically identifies input boxes, no manual configuration needed
• Toggle Control: Quickly enable/disable functionality via the extension icon

💡 How to Use:
1. Highlight the text you want to quote on any webpage
2. Click the "Quote" button that appears
3. Type your question in the AI chat input box
4. Press Enter to send, quotes and questions will be automatically formatted

⚙️ Technical Features:
• Zero dependencies, pure JavaScript implementation
• Lightweight, doesn't affect page performance
• Open source project, transparent and trustworthy code

Perfect for anyone who needs to quote web content in AI conversations.
```

**简短说明**（最多 132 字符）：
```
在AI聊天中优雅地引用文本。支持Gemini、ChatGPT、Claude等所有AI聊天平台。
```

## 🚀 发布步骤

### 第一步：注册开发者账号

1. 访问 [Chrome Web Store 开发者控制台](https://chrome.google.com/webstore/devconsole)
2. 使用你的 Google 账号登录
3. **支付一次性注册费用**：$5 USD（需要信用卡）
4. 完成开发者注册

### 第二步：准备扩展包

1. **创建 ZIP 文件**：
   - 将扩展的所有文件打包成 ZIP
   - **不要**包含 `.git` 文件夹、`screenshots` 文件夹、`README.md`、`PUBLISHING_GUIDE.md` 等非必需文件
   - 只包含：
     - `manifest.json`
     - `content.js`
     - `popup.html`
     - `popup.js`
     - `styles.css`
     - `icons/` 文件夹（包含所有图标）

2. **验证 ZIP 文件**：
   - 确保 ZIP 文件大小不超过 100 MB
   - 确保 `manifest.json` 在 ZIP 文件的根目录

### 第三步：上传扩展

1. 在开发者控制台点击 **"新增项目"**
2. 上传你准备好的 ZIP 文件
3. 等待上传完成

### 第四步：填写商店列表信息

#### 基本信息
- **商品名称**：Quote Extension for AI Chats
- **简短说明**：在AI聊天中优雅地引用文本。支持Gemini、ChatGPT、Claude等所有AI聊天平台。
- **详细说明**：使用上面准备的详细说明文本
- **类别**：选择 "生产力工具" (Productivity)
- **语言**：中文（简体）和 English

#### 图片素材
- 上传商店图块（440x280 和 920x680）
- 上传至少 1 张截图（建议上传 2-3 张）

#### 隐私权
- **隐私权政策**：如果你的扩展收集用户数据，需要提供隐私政策 URL
  - 对于 Quote Extension，我们只使用本地存储，不收集用户数据
  - 可以在 GitHub 仓库中创建 `PRIVACY.md` 文件说明这一点

#### 分发设置
- **可见性**：选择 "公开" 或 "不公开"
- **定价**：免费

### 第五步：提交审核

1. 检查所有信息是否填写完整
2. 点击 **"提交审核"**
3. 等待 Google 审核（通常需要 1-3 个工作日）

## ⚠️ 注意事项

### 权限说明

你的扩展使用了以下权限，需要在商店列表中说明：

- **activeTab**：用于读取当前标签页的选中文本
- **storage**：用于保存扩展的开关状态
- **clipboardWrite**：用于复制引用文本到剪贴板
- **host_permissions: <all_urls>**：用于在所有网站上工作

**建议添加权限说明**：
```
本扩展需要以下权限：
• 访问所有网站：为了在任何网页上提供引用功能
• 剪贴板写入：用于复制引用文本
• 本地存储：保存扩展的开关状态（数据仅存储在本地，不会上传）
```

### 审核可能被拒绝的原因

1. **权限过度**：`<all_urls>` 可能被认为权限过大
   - 解决方案：在说明中清楚解释为什么需要这个权限
   
2. **隐私政策缺失**：即使不收集数据也建议提供
   - 解决方案：创建简单的隐私政策文档

3. **功能描述不清**：审核人员无法理解扩展用途
   - 解决方案：提供清晰的截图和使用说明

## 📊 发布后的工作

### 监控和维护

1. **监控用户反馈**：定期查看 Chrome Web Store 的用户评论
2. **修复 Bug**：及时响应用户报告的问题
3. **更新版本**：
   - 修改 `manifest.json` 中的版本号
   - 创建新的 ZIP 文件
   - 在开发者控制台上传新版本

### 推广建议

1. 在 GitHub README 中添加 Chrome Web Store 徽章
2. 在社交媒体分享
3. 在相关论坛和社区介绍

## 🔗 有用的链接

- [Chrome Web Store 开发者控制台](https://chrome.google.com/webstore/devconsole)
- [Chrome 扩展发布指南](https://developer.chrome.com/docs/webstore/publish/)
- [Chrome Web Store 政策](https://developer.chrome.com/docs/webstore/program-policies/)

---

**祝你发布顺利！** 🎉

如果遇到任何问题，可以参考 Chrome 官方文档或在 GitHub 上提问。
