
import 'package:flutter/material.dart';
import '../models/account.dart';
import '../services/databaseSe.dart';
import '../widgets/account_card.dart';
import '../widgets/costom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shop Meo'),
      body: StreamBuilder<List<Account>>(
        stream: DatabaseService().getAccountList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Account> accounts = snapshot.data!;
            return ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return AccountCard(account: accounts[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Đã có lỗi xảy ra: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}