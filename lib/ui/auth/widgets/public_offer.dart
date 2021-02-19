import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:flutter/material.dart';

class PublicOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
      child: RichText(
        text: TextSpan(
            text:
                'Регистрируясь в нашем приложении Вы полностью соглашаетесь с нашими ',
            style: FontStyles.regularStyle(
                fontSize: 10, fontFamily: 'Ubuntu', color: Color(0xffBDBDBD)),
            children: [
              TextSpan(
                text: 'Правилами и Условиями пользования!',
                style: FontStyles.regularStyle(
                    fontSize: 10,
                    fontFamily: 'Ubuntu',
                    color: ColorPalatte.strongRedColor),
              )
            ]),
      ),
    );
  }
}
