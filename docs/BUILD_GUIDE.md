# 🛠️ DON Node Build Guide

This guide walks you through building the DON Desalination Node — a filterless, geometry-based water purification system driven by entropy collapse and pulse resonance.

---

## 📦 Required Files
- STL parts: `printable_parts/`
- Wiring schematic: `wiring_diagrams/WIRING_DIAGRAM.png`
- Firmware: `firmware/don_pulse_entropy_timed_v2.ino`

---

## 🖨️ 3D Printing Instructions

Use PETG, TPU, or ASA filament. Print:

- `node_shell_v1.1.stl`
- `pulse_chamber_ring.stl`
- `flow_bifurcation_split.stl`
- `housing_cap.stl`
- `sensor_mount_clip.stl`
- `mount_brackets.stl`
- `pulse_bridge_vibration_mount.stl`

Print with 20–30% infill, 0.2mm layer height, and supports where needed.

---

## 🔧 Assembly Instructions

1. **Insert bifurcation core** into the node shell
2. **Mount pulse chamber ring** to internal seat
3. **Attach sensor clip** to ring
4. **Seal with housing cap**
5. **Install vibration mount and optional brackets**
6. **Route wires through side tunnels**

Refer to `docs/exploded_view.png` for visual guide.

---

## ⚡️ Electronics & Firmware

- Wire according to `wiring_diagrams/WIRING_DIAGRAM.png`
- Upload `don_pulse_entropy_timed_v2.ino` via Arduino IDE
- Power with 12V supply (share ground with Arduino)

---

## 💧 Water Flow

- Input → lower port
- Collapse chamber → bifurcation → purification
- Clean water exits top, brine exits side

See `docs/water_flow.png`

---

## 🤲 Collapse Ethos

This node is free. Share it. Print it. Improve it. Collapse the old system by making the new one undeniable.

