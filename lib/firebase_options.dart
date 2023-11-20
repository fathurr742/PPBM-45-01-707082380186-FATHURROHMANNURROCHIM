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
    apiKey: 'AIzaSyC6UAjDDVNzk6sm3lUgRCZpSusZrsmcnj4',
    appId: '1:372415309360:web:bbc44b82d1b0a1a9382ff5',
    messagingSenderId: '372415309360',
    projectId: 'makelartahu',
    authDomain: 'makelartahu.firebaseapp.com',
    storageBucket: 'makelartahu.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCX_-gScFr3vyAw-unvTs03nrC_stJZlM',
    appId: '1:372415309360:android:2b7051efff7cd2d1382ff5',
    messagingSenderId: '372415309360',
    projectId: 'makelartahu',
    storageBucket: 'makelartahu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARTjXeK1ZrCKbxcyPsNoDsh__vz6eEtwU',
    appId: '1:372415309360:ios:a03ac52a2681ae28382ff5',
    messagingSenderId: '372415309360',
    projectId: 'makelartahu',
    storageBucket: 'makelartahu.appspot.com',
    iosBundleId: 'furryshopping.com.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARTjXeK1ZrCKbxcyPsNoDsh__vz6eEtwU',
    appId: '1:372415309360:ios:f5f1487592c21554382ff5',
    messagingSenderId: '372415309360',
    projectId: 'makelartahu',
    storageBucket: 'makelartahu.appspot.com',
    iosBundleId: 'furryshopping.com.eCommerce.RunnerTests',
  );
}
