
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyBwBajFDmRX5V9SvjMgZLyxmgFxrkLOgLI',
    appId: '1:1008464212158:web:0f0932b5614452844beeef',
    messagingSenderId: '1008464212158',
    projectId: 'firstfirebase-cfaaf',
    authDomain: 'firstfirebase-cfaaf.firebaseapp.com',
    storageBucket: 'firstfirebase-cfaaf.appspot.com',
    measurementId: 'G-N8HQC1P15Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNMRkf5zFGL85S68Sri4pz4XWLt9c_8sE',
    appId: '1:1008464212158:android:6ca13b91c18ccb634beeef',
    messagingSenderId: '1008464212158',
    projectId: 'firstfirebase-cfaaf',
    storageBucket: 'firstfirebase-cfaaf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHNavBwdPtzBwou5j9eD_cAydKnFxqM1o',
    appId: '1:1008464212158:ios:c22a15c3bd3cfcbd4beeef',
    messagingSenderId: '1008464212158',
    projectId: 'firstfirebase-cfaaf',
    storageBucket: 'firstfirebase-cfaaf.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHNavBwdPtzBwou5j9eD_cAydKnFxqM1o',
    appId: '1:1008464212158:ios:2aefacf941b7b2144beeef',
    messagingSenderId: '1008464212158',
    projectId: 'firstfirebase-cfaaf',
    storageBucket: 'firstfirebase-cfaaf.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
