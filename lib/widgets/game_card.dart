import 'package:flutter/material.dart';
import '../models/game.dart'; // Import model Game

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(game.image), // Hiển thị ảnh game
        title: Text(game.name),
        subtitle: Text(game.description), // Hoặc thông tin khác về game
        // onTap: () {
        //   // Xử lý khi người dùng nhấn vào card game
        // },
      ),
    );
  }
}