import 'package:HAMD_NEW/constants/colors.dart';

import 'package:HAMD_NEW/ui/componants/header.dart';
import 'package:HAMD_NEW/ui/componants/my_appbar.dart';

import 'package:HAMD_NEW/ui/cart/widgets/custom_radio_buttons.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(
            context,
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Корзина',
            icon2Url: 'assets/icons/close.svg',
            height2: 18,
            width2: 18,
            onpress2: () => Get.back(),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadioButtons(),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
