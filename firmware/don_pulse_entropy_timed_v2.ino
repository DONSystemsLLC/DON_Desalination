// DON Node Pulse Controller v2
// Real-time entropy collapse with timed pulsing and sensor check

const int pulsePin = 9;           // Connected to MOSFET gate
const int sensorTrig = 6;         // Ultrasonic Trig pin
const int sensorEcho = 5;         // Ultrasonic Echo pin

unsigned long pulseInterval = 5000;   // Time between pulses (ms)
unsigned long pulseDuration = 350;    // Pulse ON time (ms)
unsigned long lastPulseTime = 0;

void setup() {
  pinMode(pulsePin, OUTPUT);
  pinMode(sensorTrig, OUTPUT);
  pinMode(sensorEcho, INPUT);
  digitalWrite(pulsePin, LOW);
  Serial.begin(9600);
}

void loop() {
  unsigned long currentTime = millis();

  // Check if it's time to pulse
  if (currentTime - lastPulseTime >= pulseInterval) {
    triggerPulse();
    lastPulseTime = currentTime;
  }

  // Optional: Read and log sensor distance (field adaptation layer)
  long distance = readDistance();
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  delay(100);
}

void triggerPulse() {
  Serial.println(">> COLLAPSE TRIGGERED");
  digitalWrite(pulsePin, HIGH);
  delay(pulseDuration);
  digitalWrite(pulsePin, LOW);
}

long readDistance() {
  digitalWrite(sensorTrig, LOW);
  delayMicroseconds(2);
  digitalWrite(sensorTrig, HIGH);
  delayMicroseconds(10);
  digitalWrite(sensorTrig, LOW);

  long duration = pulseIn(sensorEcho, HIGH);
  long distance = duration * 0.034 / 2;  // Convert to cm
  return distance;
}

