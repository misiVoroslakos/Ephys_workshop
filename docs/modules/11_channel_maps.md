<!-- docs/modules/11_channel_maps.md -->
# Module 11 — Channel maps: headstage ↔ probe geometry

Channel maps are the bridge between:
- what the probe *physically is* (shanks/sites)
- what the DAQ *thinks it is* (channel numbers)
- what your analysis assumes (brain anatomy alignment)

## Why channel maps matter
- Wrong maps → wrong anatomy → wrong conclusions
- Spike sorting and CSD/laminar analyses depend on correct geometry
- Multi-shank and multiplexed designs are easy to misinterpret

## What to document every time
- Probe model + revision
- Headstage type
- Channel map file used (versioned)
- Implant orientation (photos + notes)
- Any remapping or disabled channels

## Practical advice
- Keep maps in the repo: `docs/assets/channel_maps/` or `code/channel_maps/`
- Name maps with:
  - probe model
  - headstage/DAQ
  - date/version

Example:
`NP2_4shank_headstageX_map_v2025-12-17.json`

## Exercise
Take one dataset and draw:
- shank layout
- channel numbering
- approximate anatomy alignment

## Repo navigation
- Next: [Module 12 — Preprocessing & spike sorting](12_preprocessing_spikesorting.md)
