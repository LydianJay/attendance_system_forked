# RFIDAS - RFID Attendance System

This is the client management app that let the user
add/remove/modify user and see attendance data

![RFIDAS](image.png)

## Installation
    1. Download the latest release [Release](https://github.com/LydianJay/flutter-rfid-attendance-system/releases)
    2. Run the program and set the server by pressing the settings button in the login page


## Dependencies
    ** BACKEND **
    This uses apache as it's backend server, clone and copy the folder to "www" folder in your apache webserver directory
    [Apache - PHP](https://github.com/LydianJay/flutter-rfid-attendance-system-backend)

    ** RFID **
    * The RFID that is used is an MFRC522 driven by an ESP32 *
    To setup the RFID device it needs to be connected to the internet
    and provide the IP address of the server
    [MFRC522 - ESP32](https://github.com/LydianJay/esp32-rfid-attendance-system)