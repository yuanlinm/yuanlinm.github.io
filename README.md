# yuanlinm.github.io

Single-page personal site, built with [Hugo](https://gohugo.io) and deployed
to GitHub Pages by GitHub Actions on every push to `main`.

## Editing content

Everything on the page comes from **`data/cv.yaml`**:

| Block          | Keys                                                            |
|----------------|-----------------------------------------------------------------|
| `profile`      | name, name_local, role, affiliation, avatar, initials, bio, email, github |
| `now`          | status, title, items                                            |
| `education`    | period, degree, institution                                     |
| `publications` | year, authors, title, journal, doi / url / note                 |

Text fields accept inline Markdown. A block left empty is not shown.

**Avatar:** put a square photo at `static/avatar.jpg` (≥ 400 × 400 px) and set
`avatar: /avatar.jpg`. When empty, the `initials` monogram is shown.

The browser-tab title is `title` in `hugo.toml`.

## Files

```
data/cv.yaml              page content
layouts/home.html         page structure
layouts/_partials/        head, footer, icons
assets/css/site.css       Liquid Glass styling
assets/js/glass.js        pointer highlight + section tracking in the dock
.github/workflows/        build + deploy
```

## Local preview

```bash
hugo server        # http://localhost:1313
```

## Notes on the visual system

- Glass = translucent fill + `backdrop-filter: blur saturate` + specular top
  edge + a slowly rotating iridescent rim, over a drifting blue light field.
- Motion is disabled under `prefers-reduced-motion`; transparency is removed
  under `prefers-reduced-transparency`; browsers without `backdrop-filter`
  get opaque white cards.
- System fonts only (SF Pro / Segoe UI / PingFang SC / Microsoft YaHei), no
  web-font downloads.
