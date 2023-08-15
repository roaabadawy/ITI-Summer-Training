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
    apiKey: 'AIzaSyAx4McUTK2lupm1yB9DKtTWgxn9miv6fhI',
    appId: '1:369120262464:web:506a98aae4810c6e9a22a5',
    messagingSenderId: '369120262464',
    projectId: 'itisummertraining-a7026',
    authDomain: 'itisummertraining-a7026.firebaseapp.com',
    storageBucket: 'itisummertraining-a7026.appspot.com',
    measurementId: 'G-75RJMHDQV2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXo-Gda7bsGrzDb6Ngo65SeQBEPb1EthY',
    appId: '1:369120262464:android:9aa958f1ea3b748a9a22a5',
    messagingSenderId: '369120262464',
    projectId: 'itisummertraining-a7026',
    storageBucket: 'itisummertraining-a7026.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZdnHT3T-Nv7metKsI1oiBC2CXSpxdIp0',
    appId: '1:369120262464:ios:f33df45888e286909a22a5',
    messagingSenderId: '369120262464',
    projectId: 'itisummertraining-a7026',
    storageBucket: 'itisummertraining-a7026.appspot.com',
    iosClientId: '369120262464-6v5rul1q47s4ol6kljh54m4adjvjrt70.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirst',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZdnHT3T-Nv7metKsI1oiBC2CXSpxdIp0',
    appId: '1:369120262464:ios:e8fb16bbbbf6efce9a22a5',
    messagingSenderId: '369120262464',
    projectId: 'itisummertraining-a7026',
    storageBucket: 'itisummertraining-a7026.appspot.com',
    iosClientId: '369120262464-npmlot7r2mcd3bq1ps85m96a11mmuq60.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirst.RunnerTests',
  );
}