import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ocr_app/screens/home.dart';
import 'package:ocr_app/screens/login.dart';
import 'package:ocr_app/screens/signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
