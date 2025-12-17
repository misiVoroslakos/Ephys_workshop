<!-- docs/modules/08_sync_tracking.md -->
# Module 08 — Synchronization, automation, and behavior tracking

If synchronization is wrong, the experiment is often unusable. This module is about making neural + behavior align reliably.

## What you must synchronize
- Neural recording timestamps (DAQ clock)
- Behavioral events (rewards, stimuli, licks, lever presses)
- Video frames (camera clock)
- Stimulation (opto/electrical TTLs)
- Any external sensors (IMU, treadmill, temperature, etc.)

## Gold standard principle
**Record the same event in two places** (e.g., TTL into DAQ + visible LED flash on video) so you can verify alignment.

## Practical sync methods
- TTL pulses from a master controller (Arduino/FPGA/DAQ)
- Camera frame sync lines (if supported)
- Visible/audible markers recorded by video and DAQ
- Regular “heartbeat” sync pulses for drift detection

## Behavior tracking overview
- Markerless: DeepLabCut, SLEAP
- Key considerations:
  - consistent lighting + background
  - camera placement and lens distortion
  - frame rate vs motion speed
  - storage + compression tradeoffs

## Automation (why it matters)
- Reduces human variability
- Improves reproducibility across days/animals
- Makes long experiments survivable

## Exercise
Design a sync plan for a freely-moving + opto experiment:
- what TTL lines exist?
- where do you record them?
- how do you verify alignment post hoc?

## Repo navigation
- Next: [Module 09 — Optogenetics](09_optogenetics.md)
