import 'package:shopmeo/Account/login_screen.dart';
import 'package:flutter/material.dart';
import '../PhuongAn2/Profile/bank.dart';
import '../PhuongAn2/Profile/chinhsach.dart';
import '../PhuongAn2/Profile/contact.dart';
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
        // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align content to the start
          children: [
            Center(
              // Center the profile image
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    // Half of the height/width for a perfect circle
                    child: Image.asset(
                      'images/category/cate1.png',
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
            _buildProfileItem(Icons.attach_money, "Lịch sử nạp thẻ", () {}),
            _buildProfileItem(
                Icons.shopping_cart_rounded, "Lịch sử mua hàng", () {}),
            _buildProfileItem(Icons.account_circle_rounded, "Liên hệ CSKH 24/7",
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Maihuan()));
            }),
            _buildProfileItem(Icons.checklist, "Chính sách và điều khoản", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Chinhsachbaomat()));
            }),
            _buildProfileItem(Icons.language, " Cài đặt ngôn ngữ", () {}),
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
