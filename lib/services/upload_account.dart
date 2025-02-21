import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String id;
  final int price;
  final String description;
  final List<String> imageUrls;

  Account({
    required this.id,
    required this.price,
    required this.description,
    required this.imageUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'description': description,
      'imageUrls': imageUrls,
    };
  }

  factory Account.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Account(
      id: doc.id,
      price: data['price'] as int,
      description: data['description'] as String,
      imageUrls: List<String>.from(data['imageUrls']),
    );
  }
}
Account newAccount = Account(
  id: '#1111',
  price: 250000,
  description: 'Tài khoản VIP',
  imageUrls: [
    'images/accone/acc2.1.jpeg',
    'images/accone/acc2.2.jpeg',
    'images/accone/acc2.3.jpeg',
  ],
);
CollectionReference accounts = FirebaseFirestore.instance.collection('Account');
