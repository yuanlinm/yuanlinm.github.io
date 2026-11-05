---
title: "文章模板示例：公式、表格与参考文献"
subtitle: "放在 content/articles/ 的正式文章可用的全部元素"
date: 2026-11-05T10:00:00+08:00
slug: "template-demo"
tags: [methods, R]
summary: "演示文章模板支持的元素：分节标题、KaTeX 公式、三线表、代码高亮、脚注与参考文献。"
draft: false
toc: true
---

这是一篇示例文章，用来检查正式文章可用的元素：分节标题、数学公式、三线表、代码块、脚注与参考文献。确认样式后可直接删除本文件夹。

## 1　模型设定

以 Cox 比例风险模型为例，暴露 $X$ 对结局的效应以风险比表示：

$$
h(t \mid X) = h_0(t)\,\exp(\beta X), \qquad \mathrm{HR} = e^{\beta}
$$

行内公式用 `$…$`，独立公式用 `$$…$$`；公式在构建时由 KaTeX 渲染为静态 HTML，读者端无需执行脚本。[^katex] 若正文需要美元符号本身，写作 `\$`。

## 2　基线特征表

{{< tablecaption "表 1" >}}研究对象基线特征{{< /tablecaption >}}

| 特征 | 高暴露组 | 低暴露组 |
|:---|---:|---:|
| 样本量 | [n] | [n] |
| 年龄，均数 (SD) | [x̄ (s)] | [x̄ (s)] |
| 女性，n (%) | [n (%)] | [n (%)] |

Markdown 表格自动渲染为三线表；宽表在手机上可横向滚动。

## 3　代码

```r
# Cox model, adjusted
library(survival)
fit <- coxph(Surv(time, status) ~ pm25 + age + sex, data = d)
summary(fit)
```

## 4　图片

把图片与 `index.md` 放在同一文件夹，然后：

```text
{{</* figure src="km-curve.png" caption="图 1　Kaplan–Meier 生存曲线" */>}}
```

## 参考文献

1. [作者]. [题名]. [期刊], [年份]. doi:[DOI]

[^katex]: 由 Hugo 的 `transform.ToMath` 实现，见 `layouts/_markup/render-passthrough.html`。
