import 'package:flutter/material.dart';
import 'Drawer/home_screen.dart';
import 'PhuongAn2/Controller/Cart.dart';
import 'Drawer/Favorite/favorite.dart';
import 'Drawer/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    Favorite(),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Use spaceAround for even spacing
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0; // First screen
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: currentIndex == 0 ? Colors.blue : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1; // Second screen
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? Colors.blue : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2; // Third screen
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 2 ? Colors.blue : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3; // Fourth screen
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 3 ? Colors.blue : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],

    );
  }
}