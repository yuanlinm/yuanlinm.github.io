---
title: "{{ .File.ContentBaseName | replaceRE `^\d{4}-\d{2}-\d{2}-` "" | humanize }}"
subtitle: ""
date: {{ time.In "Asia/Shanghai" now | time.Format "2006-01-02T15:04:05-07:00" }}
slug: "{{ .File.ContentBaseName | replaceRE `^\d{4}-\d{2}-\d{2}-` "" }}"
tags: []
summary: ""   # 1–2 sentences; used in RSS and link previews
draft: true   # set to false to publish
toc: true
---

<!--
  写作提示（本段为 HTML 注释，不会显示）
  - 行内公式 $\beta$，独立公式 $$ HR = e^{\beta} $$
  - 表格：在表格上方写 {{</* tablecaption "表 1" */>}}标题{{</* /tablecaption */>}}
  - 图片：把 plot.png 放在本文件夹，写 {{</* figure src="plot.png" caption="图 1　说明" */>}}
  - 脚注：正文写 [^1]，文末写 [^1]: 内容
  - 交叉引用本站文章：[标题](/blog/2026-12-01-some-note)
-->

## 背景

## 方法

## 结果

## 讨论

## 参考文献

1. 
