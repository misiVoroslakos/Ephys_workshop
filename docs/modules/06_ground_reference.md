<!-- docs/modules/06_ground_reference.md -->
# Module 06 — Ground & reference (practical rules + troubleshooting)

Ground/reference is where a lot of “mysterious noise” originates.

## Mental model (high level)
- **Reference** = what gets subtracted
- **Ground** = defines baseline/common return path
- [Grounding and Referencing for Electrophysiology Recording Systems](https://plexon.com/blog-post/point-of-reference/)

## Do I need a separate Ground and Reference?
“A ground connection is needed to establish a common DC voltage between the tissue and the amplifiers.  In the old days where the amplifiers were across the room from the electrodes with long wires in between, a separate reference wire was useful because it would pick up (roughly) the same interference as the signal electrode wires on the long cable going to the amps, and then the differential amps would cancel this interference.
But now that we have tiny headstages with amp mounted a few mm away from the electrodes, interference isn't a big problem, so it works well just to tie the reference to ground.” /Reid Harrison, Ph.D. Intan Technologies/


## What bad grounding/reference looks like
- 60 Hz / 50 Hz hum
- broadband hash
- movement-correlated artifacts
- clipping/saturation

## Troubleshooting workflow ([chart](../assets/img/noise_troubleshoot.png) by Kate Jeffery and Jim Donnett)
1. Check for saturation/clipping
2. Is noise correlated across all channels? → common-mode problem
3. Wiggle cable/connector → strain relief / intermittents
4. Turn off likely EMI sources (LED drivers, pumps, monitors, motors)
5. Try alternate reference placement

## What to document every time
- wiring diagram
- photos of cable routing
- powered devices list
- 30–60 s “noise sample” recording

## Repo navigation
- Next: [Module 07 — Head-fixed vs freely moving](07_headfixed_vs_freely_moving.md)
