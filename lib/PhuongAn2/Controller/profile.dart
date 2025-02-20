
import 'package:flutter/material.dart';
import '../Profile/bank.dart';
import '../Profile/chinhsach.dart';
import '../Profile/contact.dart';
import '../Profile/napcard.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            Center( // Center the profile image
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90), // Half of the height/width for a perfect circle
                    child: Image.asset(
                      'images/onboarding/doila.jpg',
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover, // Ensure image covers the circle
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white, // Background color for the icon
                        foregroundColor: Colors.black, // Icon color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center( // Center the ID and balance information
              child: Column(
                children: [
                  const Text("ID: huanmai", style: TextStyle(color: Colors.green, fontSize: 18)),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "So du : ", style: TextStyle(color: Colors.black, fontSize: 18)),
                        TextSpan(text: "1.000.000 ", style: TextStyle(color: Colors.red, fontSize: 18)),
                        TextSpan(text: "VND", style: TextStyle(color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), // Increased spacing

            // Use ListTile for consistent list items
            _buildProfileItem(Icons.credit_card_outlined, "Ngan Hang", () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const Bank()));
            }),
            _buildProfileItem(Icons.sd_card, "Nap The", () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const Napcard()));
            }),
            _buildProfileItem(Icons.attach_money, "Lich Su Nap The", () {}),
            _buildProfileItem(Icons.shopping_cart_rounded, "Lich Su Mua Hang", () {}),
            _buildProfileItem(Icons.account_circle_rounded, "Lien He CSKH 24/7", () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const Maihuan()));
            }),
            _buildProfileItem(Icons.checklist, "Chinh Sach Va Dieu Khoan", () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const Chinhsachbaomat()));
            }),
            _buildProfileItem(Icons.language, "Ngon Ngu", () {}),
          ],
        ),
      ),
    );
  }

  // Helper function to build ListTile items
  Widget _buildProfileItem(IconData icon, String text, VoidCallback onPressed) {
    return Card( // Add cards for better visual separation
      elevation: 2, // Add a subtle shadow
      margin: const EdgeInsets.symmetric(vertical: 8), // Spacing between cards
      child: ListTile(
        leading: Icon(icon),
        title: Text(text, style: const TextStyle(fontSize: 18)),
        onTap: onPressed,
        trailing: const Icon(Icons.arrow_forward_ios), // Add a trailing arrow
      ),
    );
  }
}