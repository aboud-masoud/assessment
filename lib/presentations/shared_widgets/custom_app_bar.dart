import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Exinity Assessment'),
      backgroundColor: const Color(0xff444444),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
