# Progress

## Baseline

- Existing user changes were preserved
- Git commands use the repository-local safe-directory override
- `node_modules`, VuePress cache, and build output were excluded from source inspection unless validation required them
- VuePress core group is pinned to `2.0.0-rc.30`
- VuePress plugin/theme group is pinned to `2.0.0-rc.130`
- Netlify and CI validation use Node 24; GitHub Pages deployment was removed

## Completed

- Regenerated `package-lock.json` from scratch against `registry.npmjs.org`
- Updated MathJax and safe transitive dependency resolutions; `npm audit` reports zero vulnerabilities
- Repaired the missing-semester and PPT archive links
- Made search tags compatible with both `tag` and `tags` frontmatter
- Added accessible keyboard/touch QR-code behavior and removed duplicate block implementation
- Added SVG response/error validation and retry behavior to the floor search
- Replaced scripted file downloads with native anchor behavior
- Lazy-loaded the floor search component, reducing the main app bundle from about 212 KiB to 88 KiB and producing a separate 5.9 KiB chunk

## Validation

- `npm ls --depth=0`: passed
- `npm audit --package-lock-only`: zero vulnerabilities
- `npm run docs:build`: passed, 41 pages rendered
- Static public-resource scan: all referenced assets exist

## Remaining

- Final clean-install verification and parent diff review remain
- Large font and ZIP assets are documented performance costs; moving or subsetting them requires a separate content/deployment decision

## Review fixes

- Replaced the floor loader's single loading flag with per-floor shared promises, so concurrent searches await the same request
- Applied Node 24 to every Netlify build context
- Disabled the legacy GitHub Pages deployment script
