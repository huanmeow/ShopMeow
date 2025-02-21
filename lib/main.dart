import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopmeo/screens/forget_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      HomeScreen(),
      //_getHomeScreen(),
    );
  }
  Widget _getHomeScreen() {
    if (AuthService().currentUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}