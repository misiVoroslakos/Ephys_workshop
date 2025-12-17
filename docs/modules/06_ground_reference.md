<!-- docs/modules/06_ground_reference.md -->
# Module 06 — Ground & reference (practical rules + troubleshooting)

Ground/reference is where a lot of “mysterious noise” originates.

## Mental model (high level)
- **Reference** = what gets subtracted
- **Ground** = defines baseline/common return path

## What bad grounding/reference looks like
- 60 Hz / 50 Hz hum
- broadband hash
- movement-correlated artifacts
- clipping/saturation

## Troubleshooting workflow (fast)
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
