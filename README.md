# Plant Monitoring Application

Plant Monitoring Application is a comprehensive solution designed to monitor the temperature and humidity of your plants using an ESP32 and a mobile app. The app is built with Flutter for iOS, Android, and Web. The Arduino part includes the code for ESP32 to gather temperature and humidity data from the plant and send it to Firebase through the server's API. The server is built with the Flask framework, and it is responsible for providing APIs for sending data to Firebase from the Arduino.

## Prerequisites

- ESP32 device
- Flutter SDK
- Dart SDK Version >= 2.18.5 < 3.0.0
- Arduino IDE
- Firebase account

## Aplication Flow

1. **Hardware Setup:** Users must have an ESP32 module working correctly with the provided Arduino code to gather temperature and humidity data from the plant.

2. **Server Deployment:** The server, built with Flask, has been deployed to the cloud and is ready to provide APIs for the Arduino to communicate with Firebase.
3. **Frontend:**
   - **Welcome:** Users are greeted with a Welcome page upon opening the app.
   - **Sign Up/Sign In:** Users can choose to click the Sign Up or Sign In button to perform the corresponding action. After successful registration or signing in, users are redirected to the Plants View page.
   - **Plants View:** This page displays all the plants the user is monitoring. Initially, there are no plants. Users must register their IoT device first.
   - **Register IoT Device:** Users enter the IoT device ID and the plant name being monitored by the IoT device. Users may optionally upload an image for the plant during registration. Upon successful registration, the plant will appear on the Plants View page.
   - **Plant Information:** Users can click on a plant card to view detailed information about the plant's temperature and humidity.

## Getting Started

To use the Plant Monitoring Application, follow these steps:

1. Set up the hardware with an ESP32 module and the provided Arduino code.
2. Clone this repository.
3. Run flutter application which can be iOS, Android, or Web.
4. Register your IoT device with the app by providing the device ID and plant name.
5. Start monitoring your plants by viewing the temperature and humidity data on the app.

## Limitations

- The application is only able to monitor the temperature and humidity of plants, and cannot detect other factors that may affect plant health.
- The application requires an ESP32 device to function properly, which may limit its accessibility to users who do not own such a device.
