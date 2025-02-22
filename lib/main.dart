import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shopmeo/screens/login_screen.dart';
import 'package:shopmeo/services/auth_service.dart';
import 'PhuongAn2/Provider/favorite_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ] ,
      child: MyApp(),
    ),
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
     // HomeScreen(),
      _getHomeScreen(),
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