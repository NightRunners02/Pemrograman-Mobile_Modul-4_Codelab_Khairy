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
    apiKey: 'AIzaSyAFa5Qs9legxx0Qgu4d7b5lBd9Y_KOzIwI',
    appId: '1:816662648732:web:d253b9757031a9f08d9a59',
    messagingSenderId: '816662648732',
    projectId: 'modul3-cc858',
    authDomain: 'modul3-cc858.firebaseapp.com',
    storageBucket: 'modul3-cc858.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtkuCIs9DW1bL0fUFLon6mlkSSu-LJa8g',
    appId: '1:816662648732:android:266598925f95c1f58d9a59',
    messagingSenderId: '816662648732',
    projectId: 'modul3-cc858',
    storageBucket: 'modul3-cc858.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDP-OmUThl5tnaueRGHX365_oL0utjE11o',
    appId: '1:816662648732:ios:bb6689e97544ca828d9a59',
    messagingSenderId: '816662648732',
    projectId: 'modul3-cc858',
    storageBucket: 'modul3-cc858.firebasestorage.app',
    iosBundleId: 'com.example.tes',
  );
}
