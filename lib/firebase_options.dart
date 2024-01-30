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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCyyLkzRPmRLTWAKBpJk4m3Zh9vrYLCWG8',
    appId: '1:997835784012:web:04c77dc24e6dde38b919e9',
    messagingSenderId: '997835784012',
    projectId: 'campus1-8df71',
    authDomain: 'campus1-8df71.firebaseapp.com',
    storageBucket: 'campus1-8df71.appspot.com',
    measurementId: 'G-ZEZH70JR07',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSVJgnlkB35Hs1UvivVMkn-8q8-PI6CD0',
    appId: '1:997835784012:android:5dcb60f22af6819eb919e9',
    messagingSenderId: '997835784012',
    projectId: 'campus1-8df71',
    storageBucket: 'campus1-8df71.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVLJyAOeA8r5zJer8QU3JXbSVy89j6uME',
    appId: '1:997835784012:ios:25430b61142148f6b919e9',
    messagingSenderId: '997835784012',
    projectId: 'campus1-8df71',
    storageBucket: 'campus1-8df71.appspot.com',
    iosBundleId: 'com.example.campus1',
  );
}