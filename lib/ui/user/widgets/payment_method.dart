import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatefulWidget {
  int selectedRadio;

  int selectedCard;
  PaymentMethod({this.selectedRadio, this.selectedCard});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  selectedRadioValue(int val) {
    widget.selectedRadio = val;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorPalatte.strongRedColor,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, StateSetter state) {
                          return Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  ' Добавить новую карту',
                                  style: FontStyles.mediumStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff0E0E0E),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(
                                        'assets/icons/uzcard.svg',
                                        width: 40,
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        activeColor: Color(0xffFFBC41),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        value: 1,
                                        groupValue: widget.selectedRadio,
                                        onChanged: (val) {
                                          print('Radio $val');
                                          if (widget.selectedCard == 2) {
                                            setState(() {
                                              widget.selectedCard = 1;
                                            });
                                            print(
                                                'your selecte Card: ${widget.selectedCard}');
                                          }
                                          state(() {
                                            print(
                                                'your selected radio is: ${widget.selectedRadio}');
                                            selectedRadioValue(val);
                                          });
                                          Get.back();
                                        },
                                        title: Text(
                                          'UzCard',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff0E0E0E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        'assets/images/humo.png',
                                        width: 40,
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        activeColor: Color(0xffFFBC41),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        value: 2,
                                        groupValue: widget.selectedRadio,
                                        onChanged: (val) {
                                          if (widget.selectedCard == 1) {
                                            setState(() {
                                              widget.selectedCard = 2;
                                            });
                                            print(
                                                'your selecte Card: ${widget.selectedCard}');
                                          }
                                          state(() {
                                            print(
                                                'your selected radio is: ${widget.selectedRadio}');
                                            selectedRadioValue(val);
                                          });
                                          print('Radio $val');
                                          selectedRadioValue(val);
                                          Get.back();
                                        },
                                        title: Text(
                                          'Humo',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff0E0E0E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
          widget.selectedCard == 1
              ? Image.asset(
                  'assets/images/card-uzcard.png',
                  width: 254,
                )
              : Image.asset(
                  'assets/images/humoCard.png',
                  width: 254,
                )
        ],
      ),
    );
  }
}
