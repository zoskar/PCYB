
<br />


## Project

This project was created for a university course "PCYB" at Warsaw University of Technology. It is a mobile app for Android and iOS made to implement and test In-App Protection SDK by [Talsec](https://www.talsec.app/).

### Built With

* [Flutter](https://flutter.dev/)
* [Firebase Authentication](https://firebase.google.com/docs/auth)
* [Firebase Realtime Database](https://firebase.google.com/docs/database)
* [freeRASP](https://www.talsec.app/freerasp-in-app-protection-security-talsec)


## App

Application simulates simple banking app. It consists of authentication process handled by Firebase Authentication and database operated by Firebase Realtime Database. 

#### Authentication

Authentication process is a standard login (email) and password verification.

<img width="1031" alt="image" src="https://user-images.githubusercontent.com/29405522/213669063-948fb229-8f29-490f-b533-28049bd984c7.png">

<img width="234" alt="image" src="https://user-images.githubusercontent.com/29405522/213669428-991ea6d1-8238-4574-b1bc-e0c0727faf62.png">

### Database

Database is simple key:value structure with balance of the account being the key. It allows for queries only from verified user.

<img width="451" alt="image" src="https://user-images.githubusercontent.com/29405522/213669935-efb188be-d2d3-44fb-99a8-937faddcb6c6.png">

<img width="232" alt="image" src="https://user-images.githubusercontent.com/29405522/213670175-526ac445-ee80-4098-b09e-4abdded746a3.png">


## Security

Implemented freeRASP is capable of detecting and handling such threats as

* Detecting rooted or jailbroken devices
* Emulator detection
* Hook detection
* App tampering detection
* Debugger detection
* Detecting unofficial installation
* Device binding detection
* Keystore/Keychain secure storage check
* Device lock

## Testing




