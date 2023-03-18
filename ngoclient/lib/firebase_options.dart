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
    apiKey: 'AIzaSyBULM83ZrHb_kUDHvHn3AYZf6PQnc2lvnw',
    appId: '1:586386572036:web:30dc754e14208fe6da4651',
    messagingSenderId: '586386572036',
    projectId: 'ngo-platform-cc850',
    authDomain: 'ngo-platform-cc850.firebaseapp.com',
    storageBucket: 'ngo-platform-cc850.appspot.com',
    measurementId: 'G-TXR3PHXQKK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZXqTN6z-cxvBDPNVXltP0JQqEG80bR74',
    appId: '1:586386572036:android:ae86fd0f3c664b2fda4651',
    messagingSenderId: '586386572036',
    projectId: 'ngo-platform-cc850',
    storageBucket: 'ngo-platform-cc850.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfKrfXL8sPo6N9y2SCLBYyc9Tj8bTtsxs',
    appId: '1:586386572036:ios:46a75c7d16661411da4651',
    messagingSenderId: '586386572036',
    projectId: 'ngo-platform-cc850',
    storageBucket: 'ngo-platform-cc850.appspot.com',
    iosClientId: '586386572036-qpdu0jvgfnbbjdl618a493noli7u57vb.apps.googleusercontent.com',
    iosBundleId: 'com.example.ngoclient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfKrfXL8sPo6N9y2SCLBYyc9Tj8bTtsxs',
    appId: '1:586386572036:ios:46a75c7d16661411da4651',
    messagingSenderId: '586386572036',
    projectId: 'ngo-platform-cc850',
    storageBucket: 'ngo-platform-cc850.appspot.com',
    iosClientId: '586386572036-qpdu0jvgfnbbjdl618a493noli7u57vb.apps.googleusercontent.com',
    iosBundleId: 'com.example.ngoclient',
  );
}