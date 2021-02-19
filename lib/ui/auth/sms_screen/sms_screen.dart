import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:HAMD_NEW/ui/auth/auth_screen/widgets/form_number.dart';
import 'package:HAMD_NEW/ui/auth/sms_screen/widgets/form_sms.dart';
import 'package:HAMD_NEW/ui/auth/widgets/logo_item.dart';
import 'package:HAMD_NEW/ui/auth/sms_screen/widgets/sms_text_item.dart';
import 'package:HAMD_NEW/ui/auth/widgets/public_offer.dart';
import 'package:flutter/material.dart';

class SmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: <Widget>[
                      LogoItem(
                        imageUrl: 'assets/images/logo.png',
                      ),
                      SmsTextItem(
                        myText:
                            'Сейчас Вы получите 4-значный код верификации,мы отправили его на номер +998 •• ••• ••24',
                      ),
                      SizedBox(height: 40),
                      FormSms(),
                    ],
                  ),
                  Spacer(),
                  PublicOffer(),
                ],
              ),
            ),
          )),
    );
  }
}
