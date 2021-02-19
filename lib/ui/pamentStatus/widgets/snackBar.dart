import 'package:HAMD_NEW/constants/colors.dart';
import 'package:HAMD_NEW/constants/fonts.dart';
import 'package:HAMD_NEW/custom-icons/hamd_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SnacBar {
  String extraComments;
  final _formKey = GlobalKey<FormState>();

  List<RatingButtons> ratingButton = <RatingButtons>[
    RatingButtons(id: 1, title: 'Качество'),
    RatingButtons(id: 2, title: 'Лаваш'),
    RatingButtons(id: 3, title: 'Доставкв'),
    RatingButtons(id: 4, title: 'Сервис и обслуживание'),
    RatingButtons(id: 5, title: 'Напитки'),
    RatingButtons(id: 6, title: 'Упаковка'),
    RatingButtons(id: 7, title: 'Десерт'),
  ];

  _showSnackBar(BuildContext context) {
    int filledStars;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Container(
            height: 440,
            width: MediaQuery.of(context).size.width * .75,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/close-alt.svg',
                        width: 22,
                        height: 22,
                      ),
                      onPressed: () => Get.back()),
                ),
                Text(
                  'Как Вы оцениваете наши блюда?',
                  textAlign: TextAlign.center,
                  style: FontStyles.boldStyle(
                    fontSize: 23,
                    fontFamily: 'Product Sans',
                    color: Color(0xff414141),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 45),
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/food/lavash.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SmoothStarRating(
                  color: ColorPalatte.strongRedColor,
                  rating: 1,
                  isReadOnly: false,
                  size: 30,
                  borderColor: Colors.grey,
                  filledIconData: Hamd.star_rate,
                  defaultIconData: Hamd.star_rate_active,
                  starCount: 5,
                  allowHalfRating: false,
                  spacing: 10.0,
                  onRated: (value) {
                    filledStars = value.toInt();
                    filledStars > 0
                        ? _secondSnackBar(context, filledStars)
                        : null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _secondSnackBar(BuildContext context, filledStars) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter state) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(),
                  width: MediaQuery.of(context).size.width * .75,
                  height: MediaQuery.of(context).size.height * .75,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Text(
                                'Спасибо за вашу оценку!',
                                textAlign: TextAlign.center,
                                style: FontStyles.boldStyle(
                                  fontSize: 20,
                                  fontFamily: 'Product Sans',
                                  color: Color(0xff414141),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 50, right: 45),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        filledStars.toInt(),
                                        (context) => Expanded(
                                          child: Icon(
                                            Hamd.star_rate,
                                            color: ColorPalatte.strongRedColor,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                'Что именно вам понравилось?',
                                style: FontStyles.boldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Product Sans',
                                  color: Color(0xff414141),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Wrap(
                                spacing: 5.0,
                                children: List.generate(
                                  ratingButton.length,
                                  (index) => RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    onPressed: () {
                                      state(() {
                                        ratingButton[index].selected =
                                            !ratingButton[index].selected;

                                        print(ratingButton[index].id);
                                        print(ratingButton[index]
                                            .selected
                                            .toString());
                                      });
                                      print('your selected button is');
                                      print(ratingButton[index].id);
                                    },
                                    child: Text(
                                      ratingButton[index].title,
                                      style: FontStyles.regularStyle(
                                        fontSize: 12,
                                        fontFamily: 'Product Sans',
                                        color: ratingButton[index].selected
                                            ? Colors.white
                                            : Color(0xff9F111B),
                                      ),
                                    ),
                                    color: ratingButton[index].selected
                                        ? ColorPalatte.strongRedColor
                                        : Color(0xffF4E5E6),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              Divider(
                                color: Colors.black,
                              ),
                              SizedBox(height: 25),
                              Text(
                                'Пожалуйста, добавьте отзыв',
                                style: FontStyles.boldStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff414141),
                                ),
                              ),
                              SizedBox(height: 15),
                              Form(
                                key: _formKey,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Color(0xff414141),
                                    ),
                                  ),
                                  child: TextFormField(
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 15, left: 15.0),
                                      hintText: 'Введите полученный код',
                                      hintStyle: FontStyles.regularStyle(
                                        fontSize: 12,
                                        fontFamily: 'Monstserrat',
                                        color: Color(0xff9E9E9E),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                    onSaved: (input) => extraComments = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 54,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: RaisedButton(
                          elevation: 0,
                          color: ColorPalatte.strongRedColor,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'ОТПРАВИТЬ ОТЗЫВ',
                            style: FontStyles.mediumStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

class RatingButtons {
  final int id;
  final String title;
  Color colorButton = Color(0xffEF9494);
  bool selected = false;
  RatingButtons({this.id, this.title, this.colorButton});
}
