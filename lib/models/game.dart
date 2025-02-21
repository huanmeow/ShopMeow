import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String id;
  final String name;
  final String description;
  final String image;

  Game({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Game.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Game(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {

      'name': name,
      'description': description,
      'image': image,
    };
  }
}