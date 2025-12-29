<!-- docs/modules/12_preprocessing_spikesorting.md -->
# Module 12 — Preprocessing & spike sorting

This module is a **high-level checklist** for taking raw extracellular recordings to “sorting-ready” data. The goal is to keep the website readable and put the step-by-step procedure into a reusable MATLAB function.

## Pre-requisite
- You understand how channel maps are created. If not, please do the exercise in **Module 11**.

## Data
- Head-fixed mouse expressing Channelrhodopsin-2 in pyramidal cells is recorded with two probes:
	- 64-15 probe (Diagnostic Biochips) targeting CA1 region of the hippocampus.
	- H2 probes (Cambridge Neurotech) targeting CA3 region of the hippocampus.
- Intan RHD USB Eval system is used to record data at 20 kS/s.
	- port-A: 64-15 probe
	- port-B: H2 probe
	- digital input 0: TTL information for light delivery
- Raw data can be found at Zenodo: ADD LINK.

## What this module covers
- Create your 'xml' file.
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
- (Optional) `YOURmanipulation.manipulation.mat`
- (Optional) artifact-cleaned `.dat`
- A cleaner dataset for spike sorting

## MATLAB tutorial
Run the preprocessing function from MATLAB:

- [`code/matlab/ephys_preprocess_buzcode.m`](../../code/matlab/ephys_preprocess_buzcode.m)

> Tip: open the `.m` file — the top comment block contains a “quick start” example you can copy-paste.
