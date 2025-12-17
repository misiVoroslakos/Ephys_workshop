<!-- docs/modules/12_preprocessing_spikesorting.md -->
# Module 12 — Preprocessing & spike sorting

This module is the minimal pipeline from raw data to units + QC.

## The pipeline (typical)
1. Data integrity check (files, dropped samples, sync lines)
2. Filtering (high-pass for spikes; band-limited LFP)
3. Referencing (common average, local reference, etc.)
4. Spike detection + clustering (sorter)
5. Curation + QC
6. Export units + metrics
7. Downstream analyses (PSTHs, decoding, coupling, etc.)

## What can go wrong (common)
- Bad channel map → wrong geometry
- Poor reference → sorter struggles (common-mode noise)
- Drift → split units or merged units
- Motion artifacts → false spikes
- Saturation → unusable segments

## Minimal QC metrics to report
- number of units by quality class
- firing rates + ISI violations
- waveform stability over time
- drift measures
- fraction of contamination / refractory violations
- yield per region/shank (if applicable)

## Practical suggestions
- Save intermediate artifacts:
  - filtered snippets
  - drift plots
  - sorter logs
- Version the exact parameters used

## Exercise
Given a sorted dataset:
- identify 3 good units + 3 bad units and explain why
- quantify drift in one shank
- compare yield before/after a reference change

## Repo navigation
- Back to: [Front page](../index.md)
