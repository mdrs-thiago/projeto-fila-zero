import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA-ZTx_GZ9-c_EdgIfVnaKDUYbhI5QMRJs",
            authDomain: "projeto-filazero-e7366.firebaseapp.com",
            projectId: "projeto-filazero-e7366",
            storageBucket: "projeto-filazero-e7366.firebasestorage.app",
            messagingSenderId: "18621855293",
            appId: "1:18621855293:web:5c7ada64ab5bd9a6511c54",
            measurementId: "G-D232J77VXV"));
  } else {
    await Firebase.initializeApp();
  }
}
