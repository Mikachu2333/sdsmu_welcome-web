# Implementation Plan

## Scope

Audit and repair the VuePress site while preserving existing user changes. Deploy only through Netlify on Node 24. Do not upgrade VuePress ecosystem groups unless their required versions are mutually available and internally consistent.

## Milestones

1. Fix confirmed content, routing, search metadata, and Netlify deployment issues; commit the changes
2. Harden and simplify client components, including SVG load failures and QR-code accessibility; commit the changes
3. Resolve the dependency-version constraint, synchronize the lockfile from package.json, run npm validation, and commit the changes
4. Apply low-risk performance optimizations supported by measurements; commit the changes
5. Run final build, audit, link/resource checks, and independent review; fix and commit remaining confirmed defects

## Validation

- `npm ci`
- `npm run docs:build`
- Static internal-link and public-resource checks
- `npm audit --package-lock-only`
- Review final Git diff and commit history
