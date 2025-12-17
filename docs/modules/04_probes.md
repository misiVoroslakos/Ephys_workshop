<!-- docs/modules/04_probes.md -->
# Module 04 — Probes: anatomy, types, vendors, and selection

“What kind of probe do I need, and what are the hidden costs?”

## 1) Probe “anatomy”: acute vs chronic

### Acute probe
- No flex cable → typically **very low noise**
- Parallel lines can pick up **EMI**
- Often used in **head-fixed** prep (awake or anesthesia)

### Chronic probe
- Has a **flexible cable** to allow **mechanical decoupling**
- Typically attached to a **microdrive/shuttle**
- Often used in **freely moving** prep
- Can also be used head-fixed

## 2) Payload reality check
- Mouse weight: ~20–30 g
- Rule of thumb noted: up to ~20% of body weight can be carried (but this is *not* a free pass — behavior and welfare matter)

### Passive vs active probes
- Passive probe: ~0.6–0.8 g
- Headstage: ~1.2 g
- Active probe: ~0.6–1.2 g
- Example mentioned: MiniAmp (Cambridge)

**Practical message:** “channel count” is not the only constraint — **weight + stiffness + cable mechanics** can dominate behavioral experiments.

## 3) Vendors (Alphabetical order)
[- Cambridge Neurotech](https://www.cambridgeneurotech.com/)
[- IMEC](https://www.neuropixels.org/)
[- NeuroNexus](https://www.neuronexus.com/)
[- Plexon](https://plexon.com/)

## 4) Microdrives / shuttles
- “Microdrive, shuttle (just choose one :D)”

# Open-source vs commercial
- “None of the open-source will work” (opinion), with reasons:
  - printer tolerance
  - outdated repos / missing details
  - hidden “secrets” not shown
- Commercial is ~10× more expensive but:
  - quality control
  - works as intended

Open-source microdrives can be great *starting points*, but expect iteration and troubleshooting. If you need reliability fast, commercial often wins.

## 5) Chronic reality: losing units over time
- “Losing cells over time with Neuropixels”
- Key point: single-unit yield can get worse over days; this happens with silicon probes if you don’t move them → motivating microdrives.

Resource link from the deck:
- https://elifesciences.org/articles/59716

## 6) Neuropixels holders
A grab-bag of build protocols/videos:
- https://www.biorxiv.org/content/10.1101/2023.12.22.572441v2
- https://elifesciences.org/articles/98522
- https://www.nature.com/articles/s41596-021-00539-9
- https://www.protocols.io/view/chronic-recoverable-neuropixels-in-mice-e6nvwjo87lmk/v2
- https://elifesciences.org/articles/47188
- https://elifesciences.org/articles/59716

## 7) Microdrive resources
A grab-bag of build protocols/videos:
- https://elifesciences.org/articles/65859  (videos available)
- https://bio-protocol.org/en/bpdetail?id=4137&type=0
- https://www.jove.com/v/3568/large-scale-recording-neurons-movable-silicon-probes-behaving
- https://www.nature.com/articles/s41598-017-03340-5
- https://www.sciencedirect.com/science/article/pii/S0165027006002883
- https://www.cambridgeneurotech.com/nanodrives
- https://www.3dneuro.com/products/r2drive/
- https://www.neuronexus.com/product_documentation/microdrive/

## 8) In-workshop group exercise
Pick a probe/implant strategy for each:

**Group 1:** Freely moving mouse, dorsal CA1. Maximize simultaneously recorded single units from pyramidal layer.  
**Group 2:** Mouse somatosensory cortex; laminar processing across L2/3, L4, L5, L6.  
**Group 3:** Freely moving mouse, CM thalamus. Maximize unit yield.  
**Group 4:** Freely moving rat, putamen + motor cortex. Maximize unit yield in both.

Suggested structure for answers:
1. Target + geometry constraints (depth, extent, bilateral?)
2. Probe type (acute/chronic, passive/active, shank count)
3. Mounting (fixed vs microdrive)
4. Expected failure mode (unit loss, drift, mechanical damage, payload)
5. What you would measure to declare success

## Repo navigation
- Next module in the deck is grounding/reference.
