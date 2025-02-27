import 'package:shopmeo/Account/login_screen.dart';
import 'package:flutter/material.dart';
import 'bank.dart';
import '../PhuongAn2/Profile/napcard.dart';

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
        title: Center(
            child: const Text(
              'Tài khoản',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      'images/category/cate1.png',
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        // Background color for the icon
                        foregroundColor: Colors.black, // Icon color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              // Center the ID and balance information
              child: Column(
                children: [
                  const Text("ID: huanmai",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Số dư : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "1.000.000 ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "VND",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), // Increased spacing

            // Use ListTile for consistent list items
            _buildProfileItem(Icons.credit_card_outlined, "Nạp qua ngân hàng",
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Bank()));
            }),
            _buildProfileItem(Icons.sd_card, "Nạp qua thẻ nạp", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Napcard()));
            }),
            _buildProfileItem(Icons.logout, "Đăng xuất", () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Xác nhận đăng xuất"),
                    content: const Text("Bạn có chắc chắn muốn đăng xuất?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Hủy"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Đăng xuất"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Gọi LogoutButton ở đây
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                      ),
                    ],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
  Widget _buildProfileItem(IconData icon, String text, VoidCallback onPressed) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text, style: const TextStyle(fontSize: 18)),
        onTap: onPressed,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
