import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA9Tl5I61App_wCjN0vZLwMf3WlRzR0S_M",
            authDomain: "farmers-help-rb0ek4.firebaseapp.com",
            projectId: "farmers-help-rb0ek4",
            storageBucket: "farmers-help-rb0ek4.appspot.com",
            messagingSenderId: "590930080001",
            appId: "1:590930080001:web:db9a37061f163ca781eb00"));
  } else {
    await Firebase.initializeApp();
  }
}
