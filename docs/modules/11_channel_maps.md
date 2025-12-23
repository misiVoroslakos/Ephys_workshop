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

## Exercise
Create the channel map for this probe:
<div style="display:flex; gap:20px; align-items:flex-start;">
  <img src="../assets/img/ASSY-156-H2-map.png" alt="Probe Layout" style="width:32%;"/>
  <img src="../assets/img/RHD2164_BGA_headstage_electrode_connector_top_600.png" alt="Omnetics layout" style="width:32%;"/>
  <img src="../assets/img/RHD2164_BGA_headstage_electrode_connector_bottom_600.jpg" alt="Headstage pinout" style="width:32%;"/>
</div><br><br>
**Template (Excel):** [channel_map_empty_H2_only.xlsx](../resources/channel_map_empty_H2_only.xlsx)<br>
**Note**, that you can plug the headstage in two ways resulting in two different channel maps.<br>

## Repo navigation
- Next: [Module 12 — Preprocessing & spike sorting](12_preprocessing_spikesorting.md)
