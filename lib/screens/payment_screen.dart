import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../PhuongAn2/Models/product_models.dart';
import 'order.dart';

class PaymentScreen extends StatefulWidget {
  // Dữ liệu sản phẩm cần thanh toán (có thể truyền từ màn hình trước)
  final List<Product> products;
  final double totalPrice;

  const PaymentScreen({
    Key? key,
    required this.products,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Biến để lưu thông tin thanh toán
  String _paymentMethod = 'COD'; // Mặc định là thanh toán khi nhận hàng
  String _address = '';
  String _phoneNumber = '';
  String _note = '';

  // Hàm xử lý khi nhấn nút thanh toán
  void _handlePayment() {
    // TODO: Xử lý logic thanh toán ở đây

    for (var product in widget.products) {

    }
    // Sau khi thanh toán thành công, bạn có thể chuyển hướng người dùng đến màn hình khác
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OrderSuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin sản phẩm
              const Text(
                'Thông tin sản phẩm:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text('Giá: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND', decimalDigits: 0).format(product.price)}'),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Tổng tiền: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND', decimalDigits: 0).format(widget.totalPrice)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
              const SizedBox(height: 20),
              // Ghi chú
              const Text(
                'Ghi chú:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _note = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Nhập ghi chú',
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
      ),
    );
  }
}