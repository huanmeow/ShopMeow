import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Data Model for Top-up Item
class TopUpItem {
  final String id;
  final double amount;
  final DateTime topUpDate;

  TopUpItem({
    required this.id,
    required this.amount,
    required this.topUpDate,
  });
}

class TopUpHistoryScreen extends StatefulWidget {
  const TopUpHistoryScreen({Key? key}) : super(key: key);

  @override
  _TopUpHistoryScreenState createState() => _TopUpHistoryScreenState();
}

class _TopUpHistoryScreenState extends State<TopUpHistoryScreen> {
  // Dummy Data (Replace with your actual data fetching logic)
  List<TopUpItem> topUpHistory = [
    TopUpItem(
      id: '1',
      amount: 50000,
      topUpDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    TopUpItem(
      id: '2',
      amount: 100000,
      topUpDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    TopUpItem(
      id: '3',
      amount: 200000,
      topUpDate: DateTime.now().subtract(const Duration(days: 8)),
    ),
    TopUpItem(
      id: '4',
      amount: 150000,
      topUpDate: DateTime.now().subtract(const Duration(days: 12)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử nạp tiền'),
      ),
      body: ListView.builder(
        itemCount: topUpHistory.length,
        itemBuilder: (context, index) {
          TopUpItem item = topUpHistory[index];
          return ListTile(
            title: Text(
              'Số tiền: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND', decimalDigits: 0).format(item.amount)}',
            ),
            subtitle: Text(
              'Ngày nạp: ${DateFormat('dd/MM/yyyy HH:mm').format(item.topUpDate)}',
            ),
          );
        },
      ),
    );
  }
}