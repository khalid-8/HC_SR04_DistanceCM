//using Argon & HC_SR04 to send the Distance in cm

const int trigPin = A0;
const int echoPin = A1;
// defines variables
long duration;
int distance;
void setup() {
    pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
    pinMode(echoPin, INPUT); // Sets the echoPin as an Input
    //Serial.begin(9600); // Starts the serial communication
}
void loop() {
    // Clears the trigPin
    digitalWrite(trigPin, LOW);
    delay(500);
    // Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, HIGH);
    delay(500);
    digitalWrite(trigPin, LOW);
    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin, HIGH);
    // Calculating the distance
    distance= duration*0.034/2;
    // Prints the distance on the Serial Monitor
    Particle.publish("Distance in cm" , String(distance), PRIVATE);
    //Serial.println(distance);
} 
