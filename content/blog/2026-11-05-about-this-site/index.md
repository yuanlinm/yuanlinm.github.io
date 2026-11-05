---
title: "本站说明：写作与自动更新"
date: 2026-11-05T09:00:00+08:00
slug: "about-this-site"
tags: [site]
draft: false
---

本站由 [Hugo](https://gohugo.io) 生成，源文件在 GitHub 仓库中。每次向 `main` 分支推送，GitHub Actions 会自动构建并发布，通常一分钟内生效；主页的 Writing 列表、归档页与 RSS 同步更新。

两类写作分开存放：

- `content/articles/`：正式文章，带目录与引用信息；
- `content/blog/`：随笔与短笔记。

新建一篇：

```bash
scripts/new.sh blog my-first-note
```

这会按模板生成 `content/blog/<日期>-my-first-note/index.md`。写完后把 `draft: true` 改为 `false`，提交并推送即可。也可以不在本地安装 Hugo，直接在 GitHub 网页上复制 `archetypes/` 中的模板新建文件。

日期写在未来的文章不会立即出现；每日定时构建会在当天自动发布。
