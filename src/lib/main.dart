import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/LoginPage.dart';
import 'package:todo_app/pages/SignupPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUpPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData (primaryColor: Colors.white, useMaterial3: false),
      home: StreamBuilder(
        stream: firebaseauth.FirebaseAuth.instance.authStateChanges(),
        builder: ((contex, snap) {
          if (snap.connectionState == ConnectionState.active) {
            if (snap.hasData) {
              return HomePage();
            } else if (snap.hasError) {
              return CircularProgressIndicator();
            }
          } else if (snap.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return LogInPage();
        }),
      ),
    );
  }
}
