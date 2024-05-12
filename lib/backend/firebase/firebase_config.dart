import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCQ7F9oDNUlxhbaySCJsoGWYQuT_c0GT3Q",
            authDomain: "radical-motor-2gq1or.firebaseapp.com",
            projectId: "radical-motor-2gq1or",
            storageBucket: "radical-motor-2gq1or.appspot.com",
            messagingSenderId: "410382694655",
            appId: "1:410382694655:web:8c1402a2fdb8a60881f4ca"));
  } else {
    await Firebase.initializeApp();
  }
}
