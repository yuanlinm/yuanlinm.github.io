# yuanlinm.github.io

Personal site — a CV-style home page plus two writing streams
(**Articles** and **Blog**). Built with [Hugo](https://gohugo.io) (no external
theme) and deployed to GitHub Pages by GitHub Actions on every push to `main`.

## Layout

```
content/
  _index.md           home page (content comes from data/cv.yaml)
  articles/           formal articles: collapsible contents + citation line
  blog/               short notes
  archive.md          /archive/ — all writing grouped by year
data/cv.yaml          research, publications, education, software
archetypes/           post templates (articles/, blog/)
layouts/              templates (home, list, archive, page, partials, render hooks)
assets/css/site.css   the only stylesheet
static/               fonts, favicon, files served as-is (e.g. cv.pdf)
scripts/new.sh        create a post from a template
.github/workflows/    build + deploy
```

## Writing

```bash
scripts/new.sh articles e-value-sensitivity          # dated today
scripts/new.sh blog reading-notes 2026-12-01          # explicit date
```

This creates `content/<section>/<YYYY-MM-DD>-<slug>/index.md` from the
template. Put figures in the same folder. Set `draft: false`, commit, push —
the home page, archive, tag pages and RSS feed update automatically.

Without Hugo installed: on GitHub, *Add file → Create new file*, name it
`content/blog/2026-12-01-my-note/index.md`, and paste the front matter from
`archetypes/blog/index.md` (fill in `title`, `date`, `slug`; `draft: false`).

Front-matter keys: `title`, `subtitle`, `date`, `slug`, `tags`, `summary`,
`draft`, `toc`, `cite`, `comments`, `lang`.

Body features: footnotes `[^1]`; math `$…$` / `$$…$$` (KaTeX, rendered at
build time — write a literal dollar as `\$`); Markdown tables render as
three-line tables, with an optional `{{< tablecaption "Table 1" >}}…{{< /tablecaption >}}`
above them; figures via `{{< figure src="x.png" caption="…" >}}`.

Posts dated in the future are hidden until that day; a daily scheduled build
publishes them.

R Markdown / Quarto: render to `.md` (e.g. `quarto render x.qmd --to gfm`, or
`blogdown` with `.Rmarkdown`) and commit the resulting Markdown with its figures.

## Updating the CV

Edit `data/cv.yaml` (research, publications, education, software) and the
`[params]` block of `hugo.toml` (email, GitHub, `cv = "/cv.pdf"` after adding
`static/cv.pdf`). No template changes needed. The home page shows a Writing
section only once at least one post is published.

## Local preview

```bash
hugo server -D        # http://localhost:1313, drafts included
```

## One-time GitHub setup

Settings → Pages → Build and deployment → Source: **GitHub Actions**.

Optional comments: enable Discussions, configure [giscus](https://giscus.app),
and fill `[params.giscus]` in `hugo.toml`.

## Licences

Source Serif 4 in `static/fonts/` is under the SIL Open Font License 1.1; see
the licence file alongside it.
