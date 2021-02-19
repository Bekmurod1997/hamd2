import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageChoosing extends StatelessWidget {
  final String iconName;
  final String text;
  final Function function;
  LanguageChoosing({this.iconName, this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: RaisedButton(
        elevation: 0,
        color: Colors.white,
        onPressed: function,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SvgPicture.asset(iconName),
            SizedBox(
              width: 10,
            ),
            Text(text,
                style: FontStyles.regularStyle(
                    fontSize: 20, fontFamily: 'Ubuntu')),
          ],
        ),
      ),
    );
  }
}
