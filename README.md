# Electrophysiology Workshop

Materials for a practical workshop on extracellular electrophysiology: probes, implants, grounding/reference, head-fixed vs freely-moving setups, synchronization + tracking, optogenetics, flexible probes, and preprocessing/spike sorting.

**Instructor:** Misi Voroslakos (Buzsáki Lab, NYU)  
**Date:** 2025-12-11

## Start here
- **Front page / website:** [docs/index.md](docs/index.md)
- **Slides (PDF):** [slides/Electrophysiology_Workshop.pdf](slides/Electrophysiology_Workshop.pdf)
	- Each slide has a reference to the Modules here in the top right corner from M01 to M12.

## Who this is for
Trainees and researchers who want to understand and execute modern extracellular ephys experiments (silicon probes, Neuropixels, microdrives) and the practical engineering tradeoffs.

## Learning goals
By the end, you should be able to:
1. Choose an appropriate probe + implant approach for a scientific question.
2. Understand the full acquisition chain (probe → headstage → DAQ → sync).
3. Make informed grounding/reference decisions and troubleshoot noise.
4. Plan a recording preparation (head-fixed or freely-moving).
5. Outline a preprocessing + spike sorting pipeline and common pitfalls.
6. Design a basic optotagging experiment and interpret latency statistics.

## Modules
1. [Background & pre-work](docs/modules/01_background.md)
2. [A short history of extracellular recording](docs/modules/02_history.md)
3. [Parts of an extracellular ephys system](docs/modules/03_system_overview.md)
4. [Probes: anatomy, types, vendors, selection](docs/modules/04_probes.md)
5. [Microdrive vs Neuropixels (unit yield vs coverage)](docs/modules//05_microdrive_vs_neuropixels.md)
6. [Ground & reference (practical rules + troubleshooting)](docs/modules/06_ground_reference.md)
7. [Head-fixed vs freely moving: when and why](docs/modules/07_headfixed_vs_freelymoving.md)
8. [Synchronization, automation, and behavior tracking](docs/modules/08_sync_tracking.md)
9. [Optogenetics (optrodes, on-head diodes, microLED probes, optotagging)](docs/modules/09_optogenetics.md)
10. [Flexible probes: promises and reality check](docs/modules/10_flexible_probes.md)
11. [Channel maps: headstage ↔ probe geometry](docs/modules/11_channel_maps.md)
12. [Preprocessing & spike sorting](docs/modules/12_preprocessing_spikesorting.md)


## Dataset resources
See Module pages for links to public Neuropixels/example datasets.

## License
MIT/CC-BY

## Contact
Email: voroslakos@gmail.com
