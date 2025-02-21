import 'package:flutter/material.dart';

import '../models/account.dart';
import '../screens/account_details_screen.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(account.images[0]),
        title: Text(account.id),
        subtitle: Text( 'Giá: ${account.price}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(account: account),
            ),
          );
        },
      ),
    );
  }
}