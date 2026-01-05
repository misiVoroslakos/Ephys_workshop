<!-- docs/modules/05_microdrive_vs_neuropixels.md -->
# Module 05 — Microdrive vs Neuropixels (unit yield vs coverage)

Both approaches can produce excellent datasets, but they optimize **different objectives**:

- **Microdrive → maximize single-unit yield over time** by repeatedly entering fresh tissue
- **Neuropixels → maximize spatial coverage & simultaneity** with “virtual repositioning” (channel selection along a fixed shank) 

## Microdrive approach (physical repositioning)
### Typical workflow
- Implant the tip **~200 µm above target** (don't forget to adjust the [**initial height**](../assets/img/shuttle_initial_height.jpg) of the shuttle)
- After recovery: advance in small increments  
  - common pitch: **~280 µm per full turn**
  - typical steps: **¼ turn (~70 µm)** or **⅛ turn (~35 µm)**
- Loop: **advance → wait → check → repeat**
  - wait at least **~6 hours** between moves

### Why the “wait” matters
Immediately after a turn, the probe can **dimple/push tissue**; if you advance again too soon, the brain can “catch up” later and you overshoot depth

### Why microdrives often give higher unit yield
Insertion causes bleeding/edema/inflammation, increasing neuron–electrode distance. Since each site “sees” spikes from a limited radius (~100 µm), this can look like losing cells over hours/days. A microdrive lets you move into **fresh, less reactive tissue** and recover yield

### What you get (practical expectation)
Often **~1–3 days** of a high-quality population, then advance again to sample a new set of neurons.

## Neuropixels approach (virtual repositioning)
### Typical workflow
- Implant to **span the target** (often slightly deeper than the main zone), then map anatomy from signatures 
- “Move” channels virtually by selecting recording sites along the shank

### What tends to happen over time
Progressive **single-unit loss from day 1** is common in chronic NP datasets (often noticeable over the first week).<br>
Papers that quantified this: [Luo et. al.](https://elifesciences.org/articles/59716); [Bimbard et. al.](https://elifesciences.org/reviewed-preprints/98522)

### Mitigations
Head-fixed awake paradigms and minimizing tether forces can improve stability.

## Choosing based on your goal (rule of thumb)
- Choose **microdrive** if your success metric is **maximum well-isolated units** over time 
- Choose **Neuropixels** if you need **multi-region / large-volume simultaneity** and distributed timing

**Take-home:** yield vs coverage — "pick your poison".

## Neuropixels holders
A grab-bag of build protocols/videos:
- https://www.biorxiv.org/content/10.1101/2023.12.22.572441v2
- https://elifesciences.org/articles/98522
- https://www.nature.com/articles/s41596-021-00539-9
- https://www.protocols.io/view/chronic-recoverable-neuropixels-in-mice-e6nvwjo87lmk/v2
- https://elifesciences.org/articles/47188
- https://elifesciences.org/articles/59716

## Microdrive resources
A grab-bag of build protocols/videos:
- https://elifesciences.org/articles/65859  (videos available)
- https://bio-protocol.org/en/bpdetail?id=4137&type=0
- https://www.jove.com/v/3568/large-scale-recording-neurons-movable-silicon-probes-behaving
- https://www.nature.com/articles/s41598-017-03340-5
- https://www.sciencedirect.com/science/article/pii/S0165027006002883
- https://www.cambridgeneurotech.com/nanodrives
- https://www.3dneuro.com/products/r2drive/
- https://www.neuronexus.com/product_documentation/microdrive/

## My raw notes
- [Microdrive vs Neuropixels (txt)](../resources/Microdrive%20vs%20Neuropixels.txt)

## Repo navigation
- Next: [Module 06 — Ground & reference](06_ground_reference.md)
