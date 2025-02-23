
import 'package:flutter/material.dart';

class Maihuan extends StatelessWidget {
  const Maihuan({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(child: Column(
          children: [
            Text("Thông tin liên hệ\n"
                "FaceBook : Kiệu Mai Huấn \n"
                "Zalo 0393433084\n"
                "Link FB : https://www.facebook.com/profile.php?id=61550101470912",
                style: TextStyle(fontSize: 18)),
          ],

        ),
        ),
      ),
    );
  }
}
