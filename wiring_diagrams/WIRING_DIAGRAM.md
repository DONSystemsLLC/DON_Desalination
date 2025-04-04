# 🔌 DON Node Wiring Diagram

This diagram outlines how to wire the DON Node for full functionality using an Arduino Nano or Uno.

---

## 🧷 COMPONENTS

- **Arduino Nano / Uno**
- **N-channel MOSFET** (e.g., IRF540N)
- **12V solenoid valve**
- **Ultrasonic sensor (HC-SR04)**
- **12V power supply (DC barrel or screw terminal)**
- **Shared GND between Arduino and external power**

---

## ⚡️ CONNECTIONS

| Component         | Arduino Pin | Notes                            |
|------------------|-------------|----------------------------------|
| MOSFET Gate       | D9          | Drives the solenoid pulse       |
| HC-SR04 Trigger   | D6          | Ultrasonic distance sensor trig |
| HC-SR04 Echo      | D5          | Ultrasonic return pin           |
| GND (MOSFET/Valve)| GND         | Shared ground from Arduino + 12V |
| VCC (Sensor)      | 5V          | Power to ultrasonic sensor      |
| 12V +             | External    | Goes to solenoid + sensor (if rated) |

---

## 🧰 TIP: Connect all GNDs together

All components must **share a common ground**. The Arduino, MOSFET, and external 12V supply **must all tie to the same GND rail** for reliable triggering.

---

## 🖼️ Fritzing Image or Schematic

Once created, insert wiring_diagrams/WIRING_DIAGRAM.png here.

---

> This setup enables fully timed pulses with optional sensor-driven collapse rhythm.

