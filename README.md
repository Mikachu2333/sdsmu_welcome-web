# 山东第二医科大学指南 Web 版

本项目是山东第二医科大学指南的 Web 版本。

本指南现已包含原 [指南（LaTex 版）](https://github.com/SDSMU-Companion/sdsmu_welcome_tex)与 [指南切片](https://github.com/SDSMU-Companion/sdsmu_welcome_tex) 的全部内容。

本项目旨在将 PDF 版本的指南线上化，让指南在不同设备上轻松浏览。

因**本项目已正式上线**，**上述项目已全部进入 Archive 状态**，不再维护。

---

本指南的内容部分遵循 [CC BY SA 4.0 LICENSE](./LICENSE-CC)，代码部分遵循 [MIT LICENSE](./LICENSE-MIT)。

The code of this project is licensed under [MIT LICENSE](./LICENSE-MIT), and the content is licensed under [CC BY SA 4.0 LICENSE](./LICENSE-CC).

## Thanks

<a href="https://www.netlify.com">
  <img src="https://www.netlify.com/assets/badges/netlify-badge-color-accent.svg" alt="Deploys by Netlify" />
</a>

## Markdown 文件简要编辑说明

### 入门

请参考以下链接学习 Markdown 文件的编辑

1. [Markdown 备忘清单](https://jaywcjlove.github.io/reference/docs/markdown.html)
2. [VuePress 生态系统](https://ecosystem.vuejs.press/zh/)
3. [HTML 备忘清单](https://reference.learntech.cn/docs/html.html)
4. [Vue 3 备忘清单](https://reference.learntech.cn/docs/vue.html)

### 示例

> 看到此处则默认你已经看完了上面的markdown入门基本知识

1. 图片插入
   1. 插入不缩放的大图片请参考 [`map_full.md`](md_files/in_school/campus_fuyanshan/maps/map_full.md) 中的做法，注意图片 svg 与 webp 的问题（仅地图需要两个）

      `<FigureImage src="图片路径" title="自己起的自定义标题" downloadLink="图片路径（通常和上面的一致，仅地图有svg与webp之分）"></FigureImage>`

   2. 行内图片（自动缩放）请参考 [`life.md` 浴室预约与使用-浮烟山校区](md_files/in_school/tutorial/life.md#浴室预约与使用)的文本

      `前面的文字 <InlineImage src="图片路径"></InlineImage> 后面的文字`

2. 提示块

    ```markdown
    ::: 此处需根据具体情况从以下几项中选择
    文字
    :::
    ```

   - `tip` 因格式原因不便在正文处给出的注释
   - `warning` 警告
   - `info` 相关信息
   - `note` 提示
   - `important` 重要提示，少用
3. 强调请参考 [`thank_lists.md` 的最后](md_files/doc_related/thank_lists.md)

   <span style="color:red; font-weight:bold; background:yellow">严禁在标题中使用加粗等自定义格式，将导致无法搜索！</span>

   1. 加粗代码为 `font-size:2em;`
   2. 字体颜色通用代码为 `color:rgb(0,0,0);`，特殊颜色可以直接写英文
   3. 背景色通用代码为 `background:rgb(0,0,0);`，特殊颜色可以直接写英文
   4. 字体加粗为 `font-weight:bold;`

   综合示例如下：

    ```markdown
    <span style="font-size:2em; color:red; font-weight:bold; background:yellow">需要加粗的文本，效果为大字、红色、背景黄色</span>
    ```

4. 双下划线请参考 [`dormitory_fuyanshan.md`](/md_files/in_school/campus_fuyanshan/dormitory_fuyanshan.md#住宿注意事项)
5. 文字标红参考 [`study.md`](/md_files/in_school/life/study.md#杂项)
6. 手动书签跳转参考 [`life.md` 的脚注 1](/md_files/in_school/tutorial/life.md#新生信息查询线上报到) 与 [`school_readiness.md` 的脚注 8](/md_files/before_school/school_readiness.md#宿舍用品)
7. 行内二维码参考 [`common_public_accounts.md`](/md_files/in_school/tutorial/common_public_accounts.md)，行间二维码参考 [thank_lists.md](/md_files/doc_related/thank_lists.md#宣传发布)

### 写作风格说明

1. 除版权声明以外，句子结尾无句号
2. 使用 `→` 作为操作步骤的连接符号
3. 穿插使用 `raw HTML` 以实现更复杂的排版需求，在可能的情况下尽量优先使用 Markdown 语法，若同时有加粗、标红等 Markdown 和 HTML 语法混杂的情况时，仅使用 HTML 语法
4. 部分行间脚注、特殊书签通过 `<span id="XXX"></span>` 的实现
5. 未显著区分 `important`、`warning`与`note`
6. 表格排版未调整
7. 大量使用了 AI 协助排版，内容无任何 AI

## 本地构建与运行

- 双击 `WORKPLACE.code-workspace` 以打开 VSCode 工作区
- 开始编辑
- 本地运行
  1. 打开终端，首次运行输入 `npm install` 安装依赖（移动目录后需先移除 `md_files/.vuepress/.cache` 文件夹，再执行 `npm install`，否则会报错）
  2. 本地预览：`npm run docs:dev`
  3. 本地构建：`npm run docs:build`
- 上传修改后的文件到 GitHub 仓库
   1. 上传前先运行 `git pull` 同步远程仓库的修改
   2. 通过 lazygit 或 VSCode 侧栏提交修改，或 `git add . && git commit -m "提交说明"`
   3. 通过 lazygit 或 `git push` 推送修改
- 部署构建产物到服务器
   1. 运行 `npm run docs:build` 构建文件
   2. 将 `md_files/.vuepress/dist` 目录中的**所有内容**上传到服务器对应目录，主页指向 `index.html`

**注意**：移动项目目录后需先删除 `md_files/.vuepress/.cache`，再执行 `npm install`，否则会报错

### 项目结构

`tree -I node_modules -o 1.txt ./`

```text
./
├── CLAUDE.md                        # Claude Code 项目说明
├── CODE_OF_CONDUCT.md               # 贡献者行为准则
├── LICENSE-CC                       # CC BY-SA 4.0（内容许可）
├── LICENSE-MIT                      # MIT（代码许可）
├── README.md                        # 项目说明（本文件）
├── WORKPLACE.code-workspace         # VS Code 工作区文件
├── deploy.ps1                       # 手动部署脚本（推送 dist 到 gh-pages）
├── env.d.ts                         # Vue SFC 类型声明
├── favicon.afdesign                 # 网站图标源文件
├── netlify.toml                     # Netlify 部署配置
├── package.json                     # 项目依赖与脚本
├── package-lock.json                # 依赖版本锁定
├── tsconfig.json                    # TypeScript 配置
│
├── md_files/                        # VuePress 源文件根目录
│   ├── index.md                     # 首页（home 布局）
│   ├── CHANGELOG.md                 # 更新日志（Web 版）
│   ├── CHANGELOG_old.md             # 更新日志（旧 LaTeX 版）
│   ├── LICENSE                      # 内容许可（CC BY-SA 4.0）
│   │
│   ├── .vuepress/                   # VuePress 配置与组件
│   │   ├── config.ts                # 主配置：主题、插件、侧边栏
│   │   ├── client.ts                # 客户端入口：注册全局组件、加载样式
│   │   ├── style.css                # 全局样式（暗色模式、CJK 排版、响应式）
│   │   ├── custom-dict.txt          # jieba 分词自定义词典（278 条目）
│   │   ├── components/              # 自定义 Vue 3 组件
│   │   │   ├── FigureImage.vue      #   全宽图片（带标题与下载）
│   │   │   ├── InlineImage.vue      #   行内小图标
│   │   │   ├── FileDownload.vue     #   文件下载按钮
│   │   │   ├── Donate.vue           #   打赏二维码
│   │   │   ├── QrCodeLink.vue       #   行内文字 + 二维码浮窗
│   │   │   ├── QrCodeBlock.vue      #   块级文字 + 二维码浮窗
│   │   │   └── MinxingFloorSearch.vue # 敏行楼 SVG 楼层图搜索
│   │   └── public/                  # 静态资源（部署到站点根路径 /）
│   │       ├── favicon.svg          #   网站图标
│   │       ├── _redirects           #   Netlify 重定向规则
│   │       ├── fonts/               #   字体文件（Noto Sans SC、Cascadia Code）
│   │       └── resources/           #   图片、地图、二维码等资源
│   │
│   ├── before_school/               # 新生入学（6 篇）
│   │   ├── school_readiness.md      #   入学准备
│   │   ├── school_register.md       #   报到流程
│   │   ├── goto_school.md           #   交通指引
│   │   ├── military_training.md     #   军训概况
│   │   ├── cost.md                  #   费用与银行卡
│   │   └── common_questions.md      #   常见问题
│   │
│   ├── doc_related/                 # 文档相关（5 篇）
│   │   ├── thank_lists.md           #   致谢
│   │   ├── copyright_statements.md  #   版权声明
│   │   ├── document_introduction.md #   指南简介
│   │   ├── calender.md              #   校历
│   │   └── epilogue.md              #   后记
│   │
│   └── in_school/                   # 在校期间内容（26 篇）
│       ├── campus_fuyanshan/        #   浮烟山校区
│       │   ├── summary_fuyanshan.md #     校区概况
│       │   ├── maps/                #     地图（4 篇）
│       │   ├── dormitory_fuyanshan.md #   宿舍
│       │   └── school_life_fuyanshan.md # 校园生活
│       ├── campus_yuhe/             #   虞河校区
│       │   ├── summary_yuhe.md      #     校区概况
│       │   ├── maps/                #     地图（3 篇）
│       │   ├── dormitory_yuhe.md    #     宿舍
│       │   └── school_life_yuhe.md  #     校园生活
│       ├── life/                    #   校园安全与学习
│       ├── further/                 #   就业与兼职
│       ├── summary/                 #   组织信息汇总
│       └── tutorial/               #   教程（8 篇）
│
└── 12 directories, 55 files
```

## 依赖升级

1. 安装 `ncu`
   - `npm install -g npm-check-updates`
2. 查看可升级的 package
   - `ncu`
3. 升级 packages
   - `ncu -u`
   - 注意：VuePress 生态插件使用 `rc` 版本标签，`ncu -u` 可能不会检出最新版本，需要手动核对
