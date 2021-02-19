import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fontSize.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:HAMD_NEW/ui/componants/header.dart';
import 'package:HAMD_NEW/ui/componants/my_appbar.dart';
import 'package:HAMD_NEW/ui/user/widgets/custom_rasied_button.dart';
import 'package:HAMD_NEW/ui/user/widgets/my_orders.dart';
import 'package:HAMD_NEW/ui/user/widgets/payment_method.dart';
import 'package:HAMD_NEW/ui/user/widgets/user_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int selectedIndex = 0;
  int selectedCard = 1;
  int active = 0;
  int selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedRadio = 1;
  }

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(
            context,
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Мой профиль',
            icon2Url: 'assets/icons/close.svg',
            height2: 18,
            width2: 18,
            onpress2: () => Get.back(),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserDataItem(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: RaisedButton(
                        elevation: 0,
                        color: selectedIndex == 0
                            ? Color(0xffE9DCE0)
                            : Colors.transparent,
                        onPressed: () {
                          if (selectedIndex == 1) {
                            setState(() {
                              selectedIndex = 0;
                            });
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'Мои заказы',
                          style: FontStyles.boldStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: RaisedButton(
                        elevation: 0,
                        color: selectedIndex == 1
                            ? Color(0xffE9DCE0)
                            : Colors.transparent,
                        onPressed: () {
                          if (selectedIndex == 0) {
                            setState(() {
                              selectedIndex = 1;
                            });
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'Методы оплат',
                          style: FontStyles.boldStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            selectedIndex == 0
                ? Container(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                    height: 500,
                    child: MyOrders(),
                  )
                : PaymentMethod(
                    selectedRadio: selectedRadio, selectedCard: selectedCard),
          ],
        ),
      ),
    );
  }
}
