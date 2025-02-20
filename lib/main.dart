import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'PhuongAn2/Home/home_screen1.dart';
import 'screens/home_screen.dart'; // Import màn hình chính
import 'screens/login_screen.dart'; // Import màn hình đăng nhập
import 'services/auth_service.dart'; // Import AuthService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mua Tài Khoản Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //HomeScreen1(),
      LoginScreen(),
      //_getHomeScreen(), // Xác định màn hình hiển thị đầu tiên
    );
  }
  Widget _getHomeScreen() {
    if (AuthService().currentUser != null) {
      return HomeScreen(); // Nếu đã đăng nhập, hiển thị HomeScreen
    } else {
      return LoginScreen(); // Nếu chưa đăng nhập, hiển thị LoginScreen
    }
  }
}