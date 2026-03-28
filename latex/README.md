# LaTeX Thesis Build

TalTech doctoral thesis formatted using the official template structure.

## Structure

```
latex/
├── thesis.tex          # Main document
├── TTUPhD.cls          # TalTech document class
├── references.bib      # Bibliography
├── Makefile            # Build automation
├── chapters/           # Chapter content (.tex)
├── img/                # Images and logos
└── art/                # Published articles (if any)
```

## Building

```bash
make          # Full build (pdflatex + bibtex)
make quick    # Single pass (for draft iteration)
make clean    # Remove build artifacts
make view     # Open PDF
```

Requires: `pdflatex`, `bibtex` (standard TeX Live installation)

## Missing Items

Before final submission:
- [ ] Add TalTech logo (img/taltech-logo.pdf)
- [ ] Fill supervisor details in thesis.tex
- [ ] Complete CV sections
- [ ] Add ISSN/ISBN when assigned
- [ ] Verify Estonian translations
