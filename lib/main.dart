import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shopmeo/screens/cart_item.dart';

import 'Drawer/Favorite/favorite_provider.dart';

import 'drawer.dart';
import 'nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=>CartProvider()),
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
      home: Drawers(),
      //LoginScreen(),
    );
  }
// Widget _getHomeScreen() {
//   if (AuthService().currentUser != null) {
//     return BottomNavBar();
//   } else {
//     return LoginScreen();
//   }
// }
}