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
    apiKey: 'AIzaSyAf6j29N4qhlIM0wIOzYDM7xncn96zyYTc',
    appId: '1:321524471156:web:5ea99333df1779fdd24821',
    messagingSenderId: '321524471156',
    projectId: 'e-mart-9abdf',
    authDomain: 'e-mart-9abdf.firebaseapp.com',
    storageBucket: 'e-mart-9abdf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhAXeGOHSYnZUbN9qUywwy-aWJSDeh3q4',
    appId: '1:321524471156:android:4fda818c0b3fcf86d24821',
    messagingSenderId: '321524471156',
    projectId: 'e-mart-9abdf',
    storageBucket: 'e-mart-9abdf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxfMhnDdVAGsapGE1gMqRD2hw57yeC4-U',
    appId: '1:321524471156:ios:0a040de6ac680a8fd24821',
    messagingSenderId: '321524471156',
    projectId: 'e-mart-9abdf',
    storageBucket: 'e-mart-9abdf.appspot.com',
    androidClientId: '321524471156-cuil1eg4ok9ms914t0p1o6gj13f2pchf.apps.googleusercontent.com',
    iosClientId: '321524471156-r53jqg3jrd8e7mb5c3242enr53gbkvr9.apps.googleusercontent.com',
    iosBundleId: 'com.example.eMart',
  );

}