import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double amount; // Số tiền cần thanh toán

  const PaymentScreen({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thanh toán')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Số tiền cần thanh toán: $amount'),
            // Các phương thức thanh toán (ví dụ: thẻ, ví điện tử)
            // ...
            ElevatedButton(
              onPressed: () {
                // Xử lý thanh toán
              },
              child: const Text('Xác nhận thanh toán'),
            ),
          ],
        ),
      ),
    );
  }
}