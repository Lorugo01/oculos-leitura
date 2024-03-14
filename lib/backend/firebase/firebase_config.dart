import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDFRMbPcX2-enlZw7yGUApFWfPfrHy2WsE",
            authDomain: "oculos-577ed.firebaseapp.com",
            projectId: "oculos-577ed",
            storageBucket: "oculos-577ed.appspot.com",
            messagingSenderId: "189360930225",
            appId: "1:189360930225:web:6caf18983f6c3841191190"));
  } else {
    await Firebase.initializeApp();
  }
}
