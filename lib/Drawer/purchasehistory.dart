import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Data Model for Purchase Item
class PurchaseItem {
  final String id;
  final String productName;
  final double price;
  final DateTime purchaseDate;

  PurchaseItem({
    required this.id,
    required this.productName,
    required this.price,
    required this.purchaseDate,
  });
}

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  // Dummy Data (Replace with your actual data fetching logic)
  List<PurchaseItem> purchaseHistory = [
    PurchaseItem(
      id: '1',
      productName: 'Product A',
      price: 100000,
      purchaseDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    PurchaseItem(
      id: '2',
      productName: 'Product B',
      price: 200000,
      purchaseDate: DateTime.now().subtract(const Duration(days: 3)),
    ),
    PurchaseItem(
      id: '3',
      productName: 'Product C',
      price: 150000,
      purchaseDate: DateTime.now().subtract(const Duration(days: 7)),
    ),
    PurchaseItem(
      id: '4',
      productName: 'Product D',
      price: 300000,
      purchaseDate: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử mua hàng'),
      ),
      body: ListView.builder(
        itemCount: purchaseHistory.length,
        itemBuilder: (context, index) {
          PurchaseItem item = purchaseHistory[index];
          return ListTile(
            title: Text(item.productName),
            subtitle: Text(
              'Ngày mua: ${DateFormat('dd/MM/yyyy HH:mm').format(item.purchaseDate)}',
            ),
            trailing: Text(
              NumberFormat.currency(locale: 'vi_VN', symbol: 'VND', decimalDigits: 0).format(item.price),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}