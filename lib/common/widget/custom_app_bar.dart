import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/menu/pop_up_menu.dart';
import '../utils/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.dialog(const PopUpMenu());
        },
        icon: Icon(
          Icons.menu,
          color: buttonColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: buttonColor,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                color: buttonColor,
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red, // inner circle color
                ),
              ),
            )
          ],
        ),
      ],
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
