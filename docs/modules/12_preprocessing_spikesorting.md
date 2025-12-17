<!-- docs/modules/12_preprocessing_spikesorting.md -->
# Module 12 — Preprocessing & spike sorting

This module is a **high-level checklist** for taking raw extracellular recordings to “sorting-ready” data. The goal is to keep the website readable and put the step-by-step procedure into a reusable MATLAB function.

## What this module covers
- Concatenating raw recording segments into one `.dat`
- Generating an LFP file for fast browsing / sleep scoring
- Building session metadata (channel groups, sampling rate, anatomy notes)
- Parsing digital TTL inputs to define stimulation/manipulation epochs
- Removing stimulation artifacts (linear interpolation windows)
- Reducing global/common-mode noise (median subtraction)
- Optional: sleep scoring and manual correction

## Practical outcomes
After running the tutorial function, you should have:
- A concatenated `.dat`
- A `.lfp` file
- Session metadata saved
- (Optional) `stimulation.mat` + `YOURmanipulation.manipulation.mat`
- (Optional) artifact-cleaned `.dat`
- A cleaner dataset for spike sorting

## MATLAB tutorial
Run the preprocessing function from MATLAB:

- [`code/matlab/ephys_preprocess_buzcode.m`](../../code/matlab/ephys_preprocess_buzcode.m)

> Tip: open the `.m` file — the top comment block contains a “quick start” example you can copy-paste.
