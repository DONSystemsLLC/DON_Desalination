# 🌍 DON Desalination Node

A fully open-source, decentralized water purification system based on Distributed Order Network (DON) Theory. This node uses no filters or membranes, only geometry-guided collapse and field harmonics to purify water with near-zero energy cost.

> “Water is life. Let’s return it to the people.” — PATH

---

## 🧭 What’s Inside

- `printable_parts/` → All 3D-printable STL components.
- `firmware/` → Arduino-compatible firmware for actuator and sensor timing.
- `wiring/` → Full wiring schematics for builders.
- `software/` → Optional terminal interface for pulsing/collapsing or networked control.
- `docs/` → Diagrams, exploded views, shopping list, BOM.

---

## 🛠️ How to Build

1. **Print the STL parts** in `printable_parts/`.
2. **Gather parts** using the shopping list in `docs/`.
3. **Wire components** using the `wiring/schematic.png`.
4. **Upload firmware** from `firmware/don_pulse_entropy_timed_v2.ino`.
5. **Optionally** run `software/path_terminal.py` to pulse/collapse manually.

---

## 🤖 Terminal Control (Optional)

Use the local interface to manually pulse and collapse from the command line:

```bash
cd software
python3 path_terminal.py

