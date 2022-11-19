import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freerasp/talsec_app.dart';
import 'package:pcyb/app.dart';
import 'package:pcyb/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initSecurity();

  runApp(const App());
}

Future<void> initSecurity() async {
  const config = TalsecConfig(
    iosConfig: IOSconfig(
      appBundleId: 'com.example.pcyb',
      appTeamId: '92G85YJJ7B',
    ),
    watcherMail: 'iasiu@icloud.com',
  );

  final callback = TalsecCallback(
    androidCallback: AndroidCallback(
      onRootDetected: () => print('root'),
      onEmulatorDetected: () => print('emulator'),
      onHookDetected: () => print('hook'),
      onTamperDetected: () => print('tamper'),
      onDeviceBindingDetected: () => print('device binding'),
      onUntrustedInstallationDetected: () => print('untrusted install'),
    ),
    iosCallback: IOSCallback(
      onSignatureDetected: () => print('signature'),
      onRuntimeManipulationDetected: () => print('runtime manipulation'),
      onJailbreakDetected: () => print('jailbreak'),
      onPasscodeDetected: () => print('passcode'),
      onSimulatorDetected: () => print('simulator'),
      onMissingSecureEnclaveDetected: () => print('secure enclave'),
      onDeviceChangeDetected: () => print('device change'),
      onDeviceIdDetected: () => print('device ID'),
      onUnofficialStoreDetected: () => print('unofficial store'),
    ),
    onDebuggerDetected: () => print('debugger'),
  );

  TalsecApp app = TalsecApp(
    config: config,
    callback: callback,
  );

  app.start();
}
