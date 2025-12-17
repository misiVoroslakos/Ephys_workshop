<!-- docs/modules/05_microdrive_vs_neuropixels.md -->
# Module 05 — Microdrive vs Neuropixels (unit yield vs coverage)

Both approaches can produce excellent datasets, but they optimize **different objectives**:

- **Microdrive → maximize single-unit yield over time** by repeatedly entering fresh tissue :contentReference[oaicite:0]{index=0}  
- **Neuropixels → maximize spatial coverage & simultaneity** with “virtual repositioning” (channel selection along a fixed shank) :contentReference[oaicite:1]{index=1}  

## Microdrive approach (physical repositioning)
### Typical workflow
- Implant the tip **~200 µm above target** :contentReference[oaicite:2]{index=2}  
- After recovery: advance in small increments  
  - common pitch: **~280 µm per full turn**
  - typical steps: **¼ turn (~70 µm)** or **⅛ turn (~35 µm)** :contentReference[oaicite:3]{index=3}  
- Loop: **advance → wait → check → repeat** :contentReference[oaicite:4]{index=4}  
  - wait at least **~6 hours** between moves :contentReference[oaicite:5]{index=5}  

### Why the “wait” matters
Immediately after a turn, the probe can **dimple/push tissue**; if you advance again too soon, the brain can “catch up” later and you overshoot depth :contentReference[oaicite:6]{index=6}.

### Why microdrives often give higher unit yield
Insertion causes bleeding/edema/inflammation, increasing neuron–electrode distance. Since each site “sees” spikes from a limited radius (~100 µm), this can look like losing cells over hours/days. A microdrive lets you move into **fresh, less reactive tissue** and recover yield :contentReference[oaicite:7]{index=7}.

### What you get (practical expectation)
Often **~1–3 days** of a high-quality population, then advance again to sample a new set :contentReference[oaicite:8]{index=8}.

## Neuropixels approach (virtual repositioning)
### Typical workflow
- Implant to **span the target** (often slightly deeper than the main zone), then map anatomy from signatures :contentReference[oaicite:9]{index=9}  
- “Move” channels virtually by selecting recording sites along the shank :contentReference[oaicite:10]{index=10}  

### What tends to happen over time
Progressive **single-unit loss from day 1** is common in chronic NP datasets (often noticeable over the first week) :contentReference[oaicite:11]{index=11}.

### Mitigations
Head-fixed awake paradigms and minimizing tether forces can improve stability :contentReference[oaicite:12]{index=12}.

## Choosing based on your goal (rule of thumb)
- Choose **microdrive** if your success metric is **maximum well-isolated units** over time :contentReference[oaicite:13]{index=13}  
- Choose **Neuropixels** if you need **multi-region / large-volume simultaneity** and distributed timing :contentReference[oaicite:14]{index=14}  

**Take-home:** yield vs coverage — “pick your poison.” :contentReference[oaicite:15]{index=15}

## Your raw notes
- [Microdrive vs Neuropixels (txt)](../resources/Microdrive%20vs%20Neuropixels.txt)

## Repo navigation
- Next: [Module 06 — Ground & reference](06_ground_reference.md)
