
import 'package:flutter/material.dart';

import '../models/account.dart';

class AccountDetailsScreen extends StatelessWidget {
  final Account account;

  const AccountDetailsScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(account.username)),
      body: Column(
        children: [
          // Hiển thị hình ảnh tài khoản
          // ...
          // Hiển thị thông tin chi tiết
          Text('Tên tài khoản: ${account.username}'),
          Text('Level: ${account.level}'),
          Text('Giá: ${account.price}'),
          // ...
          // Nút mua
          ElevatedButton(
            onPressed: () {
              // Xử lý mua tài khoản
            },
            child: Text('Mua'),
          ),
        ],
      ),
    );
  }
}