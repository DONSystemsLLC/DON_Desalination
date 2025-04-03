# 🛠️ DON Node Build Guide

This guide walks you through building the DON Desalination Node — a field-driven, geometry-based water purification system that requires no filters or membranes.

---

## 📦 Required Components

See `docs/shopping_list.md` for all items with links.

### Core Parts
- Arduino Nano or Uno
- N-channel MOSFET (e.g. IRF540N)
- 12V DC water pump
- Momentary solenoid valve (12V)
- Ultrasonic sensor (HC-SR04)
- Piezo disk or speaker
- 12V power supply
- Printed node shell + internal parts

---

## 🖨️ 3D-Printing

Print all files in the `printable_parts/` folder using PETG, TPU, or ASA.

### Recommended:
- **`node_shell_v1.1.stl`** → Outer casing
- **`pulse_chamber_ring.stl`** → Actuator mount
- **`flow_bifurcation_split.stl`** → Inner flow divider
- **`sensor_mount_clip.stl`** → Holds ultrasonic sensor

Refer to `docs/exploded_view.png` for assembly order.

---

## 🔌 Wiring Overview

Refer to `wiring/schematic.png`

| Component       | Arduino Pin |
|----------------|-------------|
| Solenoid Valve | D9 via MOSFET |
| Ultrasonic Echo| D6          |
| Ultrasonic Trig| D5          |
| Pulse Actuator | A0 (or D3)  |

Power the 12V components externally, but **share ground with Arduino.**

---

## ⏱️ Firmware Upload

Flash `don_pulse_entropy_timed_v2.ino` from the `firmware/` folder using Arduino IDE.

- Ensure the correct board/port selected.
- Upload as usual.

---

## 💻 Optional Terminal Control

To pulse/collapse manually, use the `software/path_terminal.py` interface.

```bash
cd software
python3 path_terminal.py

