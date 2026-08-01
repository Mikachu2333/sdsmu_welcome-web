## Commands

```pwsh
npm run docs:dev      # Start dev server with hot reload
npm run docs:build    # Production build → md_files/.vuepress/dist
npm run docs:serve    # Does NOT exist in package.json; use docs:dev instead
```

After moving the project directory, delete `md_files/.vuepress/.cache` before running `npm install`.

## Architecture

This is a **VuePress 2 static documentation site** — a guide for incoming students at Shandong Second Medical University. All content is authored in Markdown under `md_files/` and rendered as static HTML at build time. There is no backend, no API layer, no database, and no test suite.

### Key directories

- **`md_files/`** — All content and config. VuePress treats this as the source root.
  - **`.vuepress/config.ts`** — Main config: theme, plugins, sidebar (file-based navigation tree)
  - **`.vuepress/client.ts`** — Registers 7 custom Vue components globally
  - **`.vuepress/components/`** — Custom Vue 3 components (Composition API, `<script setup lang="ts">`)
  - **`.vuepress/public/`** — Static assets served at root `/`: SVGs, WebP maps, QR codes, fonts
  - **`.vuepress/style.css`** — Global styles with dark mode support, CJK typography, responsive breakpoints
  - **`before_school/`**, **`in_school/`**, **`doc_related/`** — Content sections (~40 pages)
  - **`index.md`** — Homepage (`home: true` layout with hero, features, CTA buttons)

### Routing

VuePress file-based routing: each `.md` file becomes an HTML page. The sidebar nav is manually defined in `config.ts` (not auto-generated from file structure).

### Custom Vue components (all global, used inline in Markdown)

| Component            | Purpose                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `FigureImage`        | Full-width figure with caption and optional download link                                                          |
| `InlineImage`        | Small inline image (scales to 1.2em line height)                                                                   |
| `FileDownload`       | Download button for files                                                                                          |
| `Donate`             | Alipay/WeChat Pay QR code donation section                                                                         |
| `QrCodeLink`         | Inline text link with QR code tooltip on hover                                                                     |
| `QrCodeBlock`        | Block-level text link with QR code hover tooltip                                                                   |
| `MinxingFloorSearch` | Interactive SVG floor plan search for Minxing Building (room number search, floor switching, highlight animations) |

Components resolve asset paths via `withBase()` from `@vuepress/client`.

### Search

Full-text search uses `@vuepress/plugin-slimsearch` with Chinese tokenization via `@node-rs/jieba` (Rust-based). A custom dictionary at `.vuepress/custom-dict.txt` (278 entries) adds university-specific terms, building names, and medical jargon. The tokenizer strips punctuation and URLs before cutting. Changelog pages are excluded from search results.

### Styling

No Tailwind — all custom CSS in `style.css`. Uses VuePress CSS custom properties (`--c-brand`, etc.) with dark mode via `html.dark` / `[data-theme="dark"]` selectors. Responsive breakpoints at 640/719/768/959/1024/1280px. Content area uses `clamp(320px, 95%, 1200px)`.

### Plugins

- `slimsearch` — Chinese full-text search (custom jieba tokenizer)
- `markdown-ext` — GFM tables, task lists, footnotes
- `markdown-stylize` — `==highlight==` markers
- `markdown-math` — Math rendering via MathJax (SVG output)
- `markdown-container` — Custom container blocks (`::: tip`, `::: warning`, etc.)

### Writing style (Markdown conventions from README)

- No period at end of sentences (except copyright statements)
- Use `→` as step connector in instructions
- Prefer Markdown; use raw HTML only for formatting Markdown can't express
- When both Markdown and HTML formatting are needed on the same text, use only HTML
- **Never use bold or custom formatting in headings** — it breaks search indexing
- Bookmarks via `<span id="XXX"></span>`

### Licensing

- Code: MIT
- Content (everything in `md_files/` except `.vuepress/`): CC BY-SA 4.0

### Versioning

The `package.json` version (`2026.4.17`) uses a date-based `YYYY.M.D` scheme, not semver.

### Deployment

Primary: Netlify (`netlify.toml`, Node 20, publish `md_files/.vuepress/dist`). Secondary: GitHub Pages via Actions (`.github/workflows/deploy.yml`). The `deploy.ps1` script is a manual alternative that force-pushes the dist directory to `gh-pages`.
