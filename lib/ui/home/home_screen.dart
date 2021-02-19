import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/ui/cart/cart_screen.dart';
import 'package:HAMD_NEW/ui/componants/my_appbar.dart';
import 'package:HAMD_NEW/ui/home/widgets/category_buttons.dart';
import 'package:HAMD_NEW/ui/home/widgets/food_card.dart';
import 'package:HAMD_NEW/ui/home/widgets/user_welcome_item.dart';
import 'package:HAMD_NEW/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import '../componants/header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(context,
              icon1Url: 'assets/icons/drawer.svg',
              height1: 9,
              width1: 9,
              onpress1: () => Get.to(UserScreen()),
              title: 'Основное меню',
              icon2Url: 'assets/icons/shopping-cart.svg',
              width2: 25,
              height2: 25,
              onpress2: () => Get.to(CartScreen())),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserWelcomeItem(),
            SizedBox(height: 20),
            CategoryButtons(),
            SizedBox(height: 20),
            FoodCard(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
