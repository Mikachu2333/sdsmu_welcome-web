# 山东第二医科大学指南 Web 版

本项目是山东第二医科大学指南的 Web 版本，包含[指南本体 LaTex 版](https://github.com/Mikachu2333/sdsmu_welcome_tex)与[指南切片](https://github.com/Mikachu2333/sdsmu_welcome_tex)的全部内容。

**本项目正式上线后，上述项目同时进入 Archive 状态**。

本项目旨在将原有的 pdf 版本线上化，让不同设备也可以轻松浏览相同的内容。

本指南内容部分仍然遵循 CC BY SA 4.0 LICENSE，代码部分遵循 MIT 许可。

## Markdown 文件简要编辑说明

### 入门

请参考以下链接学习 Markdown 文件的编辑

1. [Markdown 备忘清单](https://reference.learntech.cn/docs/markdown.html)
2. [VuePress 生态系统](https://ecosystem.vuejs.press/zh/)
3. [HTML 备忘清单](https://reference.learntech.cn/docs/html.html)
4. [Vue 3 备忘清单](https://reference.learntech.cn/docs/vue.html)

### 示例

1. 插入图片请参考 [`map_full.md`](md_files/in_school/campus_fuyanshan/maps/map_full.md)中的做法
2. 提示块支持 `info`、`warning`、`important`、`note`、`tip`等，但是一般我们只用这几个
   - `tip` 因格式原因不便在正文处给出的注释
   - `warning` 警告
   - `info` 相关信息
   - `note` 提示
   - `important` 重要提示，少用
3. 强调请参考 [`special_thanks.md`](md_files/doc_related/special_thanks.md#以及其他所有为本指南地图提供建议与改进意见的同学教师等)
4. 双下划线请参考 [`dormitory_fuyanshan.md`](/md_files/in_school/campus_fuyanshan/dormitory_fuyanshan.md#住宿注意事项)
5. 文字标红参考 [`study.md`](/md_files/in_school/life/study.md#杂项)

## 本地构建与运行

本地运行

```shell
npm run docs:dev
```

本地测试

```shell
npm run docs:build
```

本地构建与上传

```shell
./deploy.ps1
```
