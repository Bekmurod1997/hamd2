import 'package:HAMD_NEW/ObxHelper/counterState.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:HAMD_NEW/ui/cart/cart_screen.dart';
import 'package:HAMD_NEW/ui/componants/header.dart';
import 'package:HAMD_NEW/ui/componants/my_appbar.dart';
import 'package:HAMD_NEW/ui/food_details/widgets/item_description.dart';
import 'package:HAMD_NEW/ui/food_details/widgets/item_position.dart';
import 'package:HAMD_NEW/ui/food_details/widgets/main_content.dart';
import 'package:HAMD_NEW/ui/food_details/widgets/price_and_button.dart';
import 'package:HAMD_NEW/ui/food_details/widgets/rating_and_time.dart';
import 'package:flutter/material.dart';
import 'package:HAMD_NEW/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final CounterClass counterState = Get.put(CounterClass());
  @override
  Widget build(BuildContext context) {
    final sreenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: customAppBar(context,
            icon1Url: 'assets/icons/Icon-left.svg',
            height1: 14,
            width1: 14,
            onpress1: () => Get.back(),
            title: 'Лаваш Средний',
            icon2Url: 'assets/icons/shopping-cart.svg',
            width2: 25,
            height2: 25,
            onpress2: () => Get.to(CartScreen())),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          SizedBox(height: 7),
          // MainContent(),

          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 70),
            width: 250,
            height: 110,
            child: Image.asset(
              'assets/food/lavash.png',
            ),
          )),

          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 30),
                    child: Column(
                      children: [
                        RatingAndItem(),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Описание блюда',
                            style: FontStyles.mediumStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Color(0xff222E54),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: ItemDescription(),
                        ),
                        SizedBox(height: 20),
                        Spacer(),
                        PriceAndButton(),
                      ],
                    ),
                  ),
                ),
                ItemPosition(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
