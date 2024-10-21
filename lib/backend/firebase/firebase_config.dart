import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDsyYNSq3TGjAhzDBMDu-82IjEdbU5Engc",
            authDomain: "dime-a-dinner.firebaseapp.com",
            projectId: "dime-a-dinner",
            storageBucket: "dime-a-dinner.appspot.com",
            messagingSenderId: "817017699201",
            appId: "1:817017699201:web:fb15888b98365b43a84680",
            measurementId: "G-XG622JYXY3"));
  } else {
    await Firebase.initializeApp();
  }
}
