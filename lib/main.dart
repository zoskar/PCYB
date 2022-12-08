import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freerasp/talsec_app.dart';
import 'package:pcyb/app.dart';
import 'package:pcyb/firebase_options.dart';

void main() async {
  String androidAppBase64Hash = 'ABKXbsa0jPzPssUVhItzvXP3gjoxhz41FfNRTICOJSY=';

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initSecurity(androidAppBase64Hash);

  runApp(const App());
}

Future<void> initSecurity(androidAppBase64Hash) async {
  TalsecConfig config = TalsecConfig(
    androidConfig: AndroidConfig(
      expectedPackageName: 'com.example.pcyb',
      expectedSigningCertificateHash: androidAppBase64Hash,
    ),
    iosConfig: const IOSconfig(
      appBundleId: 'com.example.pcyb',
      appTeamId: '92G85YJJ7B',
    ),
    watcherMail: 'iasiu@icloud.com',
  );

  final callback = TalsecCallback(
    androidCallback: AndroidCallback(
      onRootDetected: () {
        print('root');
        SystemNavigator.pop();
      },
      onEmulatorDetected: () {
        print('emulator');
        SystemNavigator.pop();
      },
      onHookDetected: () {
        print('hook');
        SystemNavigator.pop();
      },
      onTamperDetected: () {
        print('tamper');
        SystemNavigator.pop();
      },
      onDeviceBindingDetected: () => print('device binding'),
      onUntrustedInstallationDetected: () {
        print('untrusted install');
        SystemNavigator.pop();
      },
    ),
    iosCallback: IOSCallback(
      onSignatureDetected: () {
        print('signature');
        exit(0);
      },
      onRuntimeManipulationDetected: () {
        print('runtime manipulation');
        exit(0);
      },
      onJailbreakDetected: () {
        print('jailbreak');
        exit(0);
      },
      onPasscodeDetected: () => print('passcode'),
      onSimulatorDetected: () {
        print('simulator');
        exit(0);
      },
      onMissingSecureEnclaveDetected: () => print('secure enclave'),
      onDeviceChangeDetected: () => print('device change'),
      onDeviceIdDetected: () => print('device ID'),
      onUnofficialStoreDetected: () {
        print('unofficial store');
        exit(0);
      },
    ),
    onDebuggerDetected: () {
      print('debugger');
      exit(0);
    },
  );

  TalsecApp app = TalsecApp(
    config: config,
    callback: callback,
  );

  app.start();
}
