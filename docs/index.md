<!-- docs/index.md -->
# Electrophysiology Workshop

Welcome! This site hosts the workshop materials (slides + short write-ups) for practical extracellular electrophysiology: probes, implants, grounding/reference, sync + behavior integration, and preprocessing/spike sorting.

## Quick links
- **Slides (PDF):** `../slides/Electrophysiology_Workshop.pdf`
- **Start with Module 01:** `./modules/01_background.md`

## Who this is for
Students, trainees, and researchers who want a practical map of modern extracellular ephys (silicon probes, Neuropixels, microdrives) and the engineering tradeoffs that determine data quality.

## What you’ll learn
- How to choose a probe and implant strategy for a specific question
- The end-to-end recording chain (probe → headstage → DAQ → sync)
- How to reason about grounding/reference and common noise sources
- Head-fixed vs freely-moving design tradeoffs
- How neural data syncs to cameras, stimulation, and behavior
- A realistic preprocessing + spike sorting workflow (and failure modes)

## Modules
### Core (Modules 01–04)
- [01 — Background & pre-work](modules/01_background.md)
- [02 — A short history of extracellular recording](modules/02_history.md)
- [03 — Parts of an extracellular ephys system](modules/03_system_overview.md)
- [04 — Probes: anatomy, types, vendors, selection](modules/04_probes.md)

### Coming next
These correspond to later sections of the slide deck and will be added as write-ups:
- Ground & reference (practical rules + troubleshooting)
- Head-fixed vs freely moving: when and why
- Synchronization, automation, and behavior tracking
- Optogenetics & optotagging (artifact handling + statistics)
- Flexible probes: promises and reality check
- Channel maps: headstage ↔ probe geometry
- Preprocessing & spike sorting

## How to use these materials
- **Attending live:** follow the modules in order and keep the PDF open for figures/links.
- **Self-study:** start with Modules 03–04, then jump to grounding/reference and preprocessing.

## Dataset resources
Links to public datasets and example workflows are included inside module pages as the repo evolves.

## License / attribution
If you add figures or screenshots from papers, include attribution and ensure permissions are appropriate. For original text and code, choose a license (e.g., CC-BY for text, MIT for code).

## Contact
Questions or corrections: open a GitHub issue (preferred), or email `Voroslakos@gmail.com`.
