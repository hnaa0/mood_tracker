// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDGq6oQI-nUj6sBqIyqcfAywvCM0Vuezzw',
    appId: '1:357369515522:web:64b3517f9d60e11ad6211b',
    messagingSenderId: '357369515522',
    projectId: 'mood-tracker-5bada',
    authDomain: 'mood-tracker-5bada.firebaseapp.com',
    storageBucket: 'mood-tracker-5bada.appspot.com',
    measurementId: 'G-NMBZCDFK0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBBuYpR2Yx3NO_tdoPXRGbyJ34_oD4H1Q',
    appId: '1:357369515522:android:e0a422a43ffe5abad6211b',
    messagingSenderId: '357369515522',
    projectId: 'mood-tracker-5bada',
    storageBucket: 'mood-tracker-5bada.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEUipXJnH0QFogMlEQTfCrunh9AZLrenM',
    appId: '1:357369515522:ios:20ea55248776f8cdd6211b',
    messagingSenderId: '357369515522',
    projectId: 'mood-tracker-5bada',
    storageBucket: 'mood-tracker-5bada.appspot.com',
    iosBundleId: 'com.example.moodTracker',
  );

}