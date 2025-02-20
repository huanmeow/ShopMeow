import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String id;
  final String gameId;
  final String username;
  final int level;
  final double price;
  final String description;
  final List<String> images;
  final String sellerId; // ID của người bán

  Account({
    required this.id,
    required this.gameId,
    required this.username,
    required this.level,
    required this.price,
    required this.description,
    required this.images,
    required this.sellerId,
  });

  // Factory constructor để tạo đối tượng Account từ dữ liệu Firestore
  factory Account.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Account(
      id: doc.id,
      gameId: data['gameId'],
      username: data['username'],
      level: data['level'],
      price: data['price'].toDouble(),
      description: data['description'],
      images: List<String>.from(data['images']),
      sellerId: data['sellerId'],
    );
  }

  // Hàm để chuyển đổi đối tượng Account thành Map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'gameId': gameId,
      'username': username,
      'level': level,
      'price': price,
      'description': description,
      'images': images,
      'sellerId': sellerId,
    };
  }

}
