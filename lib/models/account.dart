import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String id;
  final double price;
  final String description;
  final List<String> images;

  Account({
    required this.id,
    required this.price,
    required this.description,
    required this.images,

  });
  CollectionReference accounts = FirebaseFirestore.instance.collection('Account');
  factory Account.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Account(
      id: doc.id,
      price: data['price'].toDouble(),
      description: data['description'],
      images: List<String>.from(data['images']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gameId': id,
      'price': price,
      'description': description,
      'images': images,
    };
  }

}
