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
    apiKey: 'AIzaSyDb8I0p8KTOw_kgU5MbyeutibZv6A0AWGE',
    appId: '1:334542386090:web:d47f63988c92f40a7f31d3',
    messagingSenderId: '334542386090',
    projectId: 'plant-monitoring-7517f',
    authDomain: 'plant-monitoring-7517f.firebaseapp.com',
    storageBucket: 'plant-monitoring-7517f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGKvFdUe0kqd826O7kPHKPxDHCktGzlQQ',
    appId: '1:334542386090:android:aa579c33fd23e5287f31d3',
    messagingSenderId: '334542386090',
    projectId: 'plant-monitoring-7517f',
    storageBucket: 'plant-monitoring-7517f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0z3wrqTdbtalWzEcO-7Jv55oTNBHfemo',
    appId: '1:334542386090:ios:4fe0dc8649b560a87f31d3',
    messagingSenderId: '334542386090',
    projectId: 'plant-monitoring-7517f',
    storageBucket: 'plant-monitoring-7517f.appspot.com',
    iosClientId: '334542386090-eijvrj8m92tmf1ngi7rima9k0jhabpm3.apps.googleusercontent.com',
    iosBundleId: 'com.nipphitsinut.wirelessProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0z3wrqTdbtalWzEcO-7Jv55oTNBHfemo',
    appId: '1:334542386090:ios:4fe0dc8649b560a87f31d3',
    messagingSenderId: '334542386090',
    projectId: 'plant-monitoring-7517f',
    storageBucket: 'plant-monitoring-7517f.appspot.com',
    iosClientId: '334542386090-eijvrj8m92tmf1ngi7rima9k0jhabpm3.apps.googleusercontent.com',
    iosBundleId: 'com.nipphitsinut.wirelessProject',
  );
}
