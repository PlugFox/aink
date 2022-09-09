// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.g.dart';
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
    apiKey: 'AIzaSyAxPYNkwmrK3pc1d08fJSikzFYzw7cVUoI',
    appId: '1:830814404281:web:bc83db4e0d5c3c98452568',
    messagingSenderId: '830814404281',
    projectId: 'ai-ink',
    authDomain: 'ai-ink.firebaseapp.com',
    storageBucket: 'ai-ink.appspot.com',
    measurementId: 'G-130LM99DR9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGpt5EfTvyNBkvSJtyzPh7J-nX--cQNo8',
    appId: '1:830814404281:android:1a3bbb276a310811452568',
    messagingSenderId: '830814404281',
    projectId: 'ai-ink',
    storageBucket: 'ai-ink.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANJ5e_HPzdE_UYgQMoLoKu1LDFKRmJ9B4',
    appId: '1:830814404281:ios:c6e87d2607dc9aad452568',
    messagingSenderId: '830814404281',
    projectId: 'ai-ink',
    storageBucket: 'ai-ink.appspot.com',
    iosClientId: '830814404281-b8rp325j0gh5b24k955ku0iphp0hoh0i.apps.googleusercontent.com',
    iosBundleId: 'dev.plugfox.aink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANJ5e_HPzdE_UYgQMoLoKu1LDFKRmJ9B4',
    appId: '1:830814404281:ios:c6e87d2607dc9aad452568',
    messagingSenderId: '830814404281',
    projectId: 'ai-ink',
    storageBucket: 'ai-ink.appspot.com',
    iosClientId: '830814404281-b8rp325j0gh5b24k955ku0iphp0hoh0i.apps.googleusercontent.com',
    iosBundleId: 'dev.plugfox.aink',
  );
}
