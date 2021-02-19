import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fontSize.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:HAMD_NEW/ui/auth/sms_screen/sms_screen.dart';
import 'package:HAMD_NEW/ui/componants/header.dart';
import 'package:HAMD_NEW/ui/componants/my_appbar.dart';
import 'package:HAMD_NEW/ui/pamentStatus/payment_status_screen.dart';
import 'package:HAMD_NEW/ui/payment/widgets/address_field.dart';
import 'package:HAMD_NEW/ui/cart/widgets/custom_radio_buttons.dart';
import 'package:HAMD_NEW/ui/payment/widgets/payment_card.dart';
import 'package:HAMD_NEW/ui/payment/widgets/payment_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    String _addressField;
    int recievedIndex = Get.arguments;
    print('recieved index is: $recievedIndex');
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(
            context,
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Статус заказа',
            icon2Url: 'assets/icons/close.svg',
            height2: 18,
            width2: 18,
            onpress2: () => Get.back(),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentCard(
              sendIndex: recievedIndex,
            ),
            // SizedBox(height: 32),
            //CustomRadioButtons(),
            SizedBox(height: 32),
            AddressField(
              sendIndex: recievedIndex,
            ),

            // PaymentTypes(),
            Center(
              child: SizedBox(
                width: screenSize.width * 0.88,
                height: 63,
                child: RaisedButton(
                  elevation: 0,
                  color: Color(0xff9F111B),
                  onPressed: () => Get.to(PaymentStatusScreen()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'ЗАКАЗАТЬ',
                    style: FontStyles.mediumStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
