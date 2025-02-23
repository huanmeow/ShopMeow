import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String productName;
  final double productPrice;
  final int quantity;

  const PaymentScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = 'COD';
  String _address = '';
  String _phoneNumber = '';

  // Hàm xử lý khi nhấn nút thanh toán
  void _handlePayment() {
    // TODO: Xử lý logic thanh toán ở đây
    // Ví dụ:
    // - Kiểm tra thông tin thanh toán hợp lệ
    // - Gọi API để xử lý thanh toán
    // - Hiển thị thông báo thành công hoặc thất bại
    print('Thanh toán thành công!');
    print('Phương thức thanh toán: $_paymentMethod');
    print('Địa chỉ: $_address');
    print('Số điện thoại: $_phoneNumber');
    print('Tên sản phẩm: ${widget.productName}');
    print('Giá sản phẩm: ${widget.productPrice}');
    print('Số lượng: ${widget.quantity}');
    // Sau khi thanh toán thành công, bạn có thể chuyển hướng người dùng đến màn hình khác
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin sản phẩm
            Text(
              'Sản phẩm: ${widget.productName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Giá: ${widget.productPrice}'),
            Text('Số lượng: ${widget.quantity}'),
            const SizedBox(height: 20),
            // Phương thức thanh toán
            const Text(
              'Phương thức thanh toán:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _paymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _paymentMethod = newValue!;
                });
              },
              items: <String>['COD', 'Thẻ tín dụng', 'Ví điện tử']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Địa chỉ giao hàng
            const Text(
              'Địa chỉ giao hàng:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Nhập địa chỉ giao hàng',
              ),
            ),
            const SizedBox(height: 20),
            // Số điện thoại
            const Text(
              'Số điện thoại:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Nhập số điện thoại',
              ),
            ),
            const SizedBox(height: 30),
            // Nút thanh toán
            Center(
              child: ElevatedButton(
                onPressed: _handlePayment,
                child: const Text('Thanh toán'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}