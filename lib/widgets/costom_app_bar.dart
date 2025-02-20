import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // Bạn có thể thêm các action (icon) vào đây
      actions: [
        // Ví dụ: Icon tìm kiếm
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Xử lý tìm kiếm
          },
        ),
      ],
    );
  }
}