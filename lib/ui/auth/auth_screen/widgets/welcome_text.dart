import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String mainText;
  final String subText;
  WelcomeText({this.mainText, this.subText});
  //'Добро пожаловать'

  //'Пожалуйста, авторизуйтесь'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 30, top: 67),
      child: Column(
        children: [
          Text(
            mainText,
            style: FontStyles.boldStyle(
              fontSize: 27,
              fontFamily: 'Ubuntu',
            ),
          ),
          SizedBox(height: 10),
          Text(
            subText,
            style: FontStyles.lightStyle(
              fontSize: 19,
              fontFamily: 'Ubuntu',
            ),
          ),
        ],
      ),
    );
  }
}
