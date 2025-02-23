import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [

    ];
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Giỏ hàng',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Giỏ hàng của bạn đang trống.'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final isSelected = selectedItems.contains(index); // Kiểm tra xem sản phẩm có được chọn hay không
          return CartItemCard(
            cartItem: cartItem,
            isSelected: isSelected, // Truyền trạng thái được chọn vào CartItemCard
            onItemRemoved: () {
              setState(() {
                cartItems.removeAt(index);
                selectedItems.remove(index); // Xóa sản phẩm khỏi danh sách được chọn
              });
            },
            onSelectionChanged: (isSelected) { // Callback khi thay đổi trạng thái chọn
              setState(() {
                if (isSelected) {
                  selectedItems.add(index);
                } else {
                  selectedItems.remove(index);
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng cộng: ${calculateTotalPrice()} VNĐ',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Xử lý thanh toán cho các sản phẩm được chọn
                  processPayment(selectedItems);
                },
                child: const Text('Thanh toán'),
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }

  int calculateTotalPrice() {
    int total = 0;
    for (var index in selectedItems) { // Tính tổng tiền cho các sản phẩm được chọn
      total += cartItems[index].price * cartItems[index].quantity;
    }
    return total;
  }

  void processPayment(List<int> selectedItems) {
    // Logic xử lý thanh toán ở đây
    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn sản phẩm để thanh toán')),
      );
      return;
    }

    // ... (logic thanh toán)

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã thanh toán ${selectedItems.length} sản phẩm')),
    );
  }
}

class CartItem {
  String productName;
  int price;
  int quantity;
  String imageUrl;
  bool isAsset;

  CartItem({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.isAsset,
  });
}

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onItemRemoved;
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onItemRemoved,
    required this.isSelected,
    required this.onSelectionChanged,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: widget.isSelected,
              onChanged: (value) {
                widget.onSelectionChanged(value!);
              },
            ),
            widget.cartItem.isAsset
                ? Image.asset(
              widget.cartItem.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
                : Image.network(
              widget.cartItem.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, object, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.productName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Giá: ${widget.cartItem.price} VNĐ'),
                  const SizedBox(height: 8),
                  Text('Số lượng: ${widget.cartItem.quantity}'),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: widget.onItemRemoved,
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}