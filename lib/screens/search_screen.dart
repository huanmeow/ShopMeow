import 'package:flutter/material.dart';

import '../models/account.dart';
import '../services/databaseSe.dart';
import '../widgets/account_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<Account> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Tìm kiếm tài khoản...',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchAccounts(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return AccountCard(account: _searchResults[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _searchAccounts(String keyword) {
    DatabaseService().searchAccounts(keyword).then((results) {
      setState(() {
        _searchResults = results;
      });
    });
  }
}