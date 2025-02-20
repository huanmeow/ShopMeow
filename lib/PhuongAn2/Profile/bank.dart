import 'package:flutter/material.dart';

class Bank extends StatelessWidget {
  const Bank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nap Qua Ngan Hang'), // Thêm Text vào title
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(
            children: [
              Image.asset("images/cacdanhmuc/tech.jpg", height: 850, width: 850,),
            ],
          ),
        ),
      ),
    );
  }
}