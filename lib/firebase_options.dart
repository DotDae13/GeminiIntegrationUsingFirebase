// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7-2EGWPP1pwT5CrFP1i1UiiPSWx-pEUg',
    appId: '1:630332041411:web:9a1a089e674e551cad5a76',
    messagingSenderId: '630332041411',
    projectId: 'inferno-solutionchallenge-2024',
    authDomain: 'inferno-solutionchallenge-2024.firebaseapp.com',
    storageBucket: 'inferno-solutionchallenge-2024.appspot.com',
    measurementId: 'G-Y39H1NF4K4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAuo-271tvlvP_ndLrKBCISz9BqGEdVOg',
    appId: '1:630332041411:android:629414a15f9b90efad5a76',
    messagingSenderId: '630332041411',
    projectId: 'inferno-solutionchallenge-2024',
    storageBucket: 'inferno-solutionchallenge-2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlUWad_w-wonTQ4uxecP5WKUbuOFHxlXw',
    appId: '1:630332041411:ios:2dbeb6de407a08d0ad5a76',
    messagingSenderId: '630332041411',
    projectId: 'inferno-solutionchallenge-2024',
    storageBucket: 'inferno-solutionchallenge-2024.appspot.com',
    iosBundleId: 'com.example.geminiv3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlUWad_w-wonTQ4uxecP5WKUbuOFHxlXw',
    appId: '1:630332041411:ios:6aed889a377a608bad5a76',
    messagingSenderId: '630332041411',
    projectId: 'inferno-solutionchallenge-2024',
    storageBucket: 'inferno-solutionchallenge-2024.appspot.com',
    iosBundleId: 'com.example.geminiv3.RunnerTests',
  );
}