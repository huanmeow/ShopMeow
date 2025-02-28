import 'package:flutter/material.dart';

class Bank extends StatelessWidget {
  const Bank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nạp qua ngân hàng với nội dung : ID (của bạn)'), // Thêm Text vào title
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(
            children: [
              Image.asset("images/tech.jpg", height: 850, width: 850,),
            ],
          ),
        ),
      ),
    );
  }
}