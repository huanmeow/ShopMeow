import 'package:flutter/material.dart';

Future<void> uploadAccountToFirebase(Map<String, dynamic> accountData) async {
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Map<String, dynamic> accountData = {
          'gameName': 'Liên Quân Mobile',
          'username': 'nguyenvana',
          'level': 100,
          'price': 100000,
          'description': 'Tài khoản cực vip',
          'sellerId': 'user123',
          'images': ['imgaes/accone/acc1.1', 'imgaes/accone/acc1.2'],
        };

        uploadAccountToFirebase(accountData).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tải lên thành công')));
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi tải lên: $error')));
        });
      },
      child: Text('Tải lên tài khoản'),
    );
  }
}