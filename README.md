
<br />


## About project

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

During the testing phase we managed to simulate 5 types of behaviours which the system detects. 

### Root detection (Android emulator)

To gain access to rooted system we created Android emulator using Android Studio with system which doesn't hangle Google API (it would make running it with root configuration impossible). We alsu used adb tool to run emulator as root.

https://user-images.githubusercontent.com/29405522/213704199-34178f32-0add-41f8-8527-8b9270d6a2dd.mov

### Emulator detection (Android emulator)

Since emulator alert is made not to make life hard for developers, it doesn't trugger during developement process. To properly trigger emulator detection we had to generate APK file and install it on the emulator.

https://user-images.githubusercontent.com/29405522/213705086-c3ebce55-9cb5-4b24-9cd9-affa9955d890.mov


### Detecting unofficial installation

Since downloading APK file from the internet is counting as untrusted install all we had to do was installing APK file from previous test to device. This time we used real device.

https://user-images.githubusercontent.com/29405522/213705567-228a3aff-1e34-4847-a59b-3ef9019bd260.mp4


### App tampering detection

To trigger this event we had to install the APP on device directly from IDE.

https://user-images.githubusercontent.com/29405522/213706109-381a342f-9df6-4d72-812a-a4f2ebe85588.mov

### Keystore/Keychain secure storage check

Xcode iOS emulators don't provide safety of real devices. When running our app on emulator the event is triggered instantly.

https://user-images.githubusercontent.com/29405522/213708076-1355cb84-76fa-4814-aa06-6dae3709109d.mov
