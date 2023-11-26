import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../../../../../utils/images/images.dart';

class SliderPannar extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/panar.png'
        'assets/images/team.png'
        'assets/images/swimming.png'
  ];
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      items: imgList
          .map((e) => Stack(children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: ColorResources.background,
                          image: DecorationImage(
                            image: AssetImage(Images.slider),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: ColorResources.mainColor, width: 2)),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 15, right: 15),
                  child: Text(
                    "الإعلان",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,

                  padding: EdgeInsets.only(bottom: 15, right: 15),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear),
                      style: ElevatedButton.styleFrom(
                        primary: ColorResources.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),

                      ),
                      child: Text('أعرف أكثر'),
                    ),
                  ),
                )
              ]))
          .toList(),
      options: CarouselOptions(
        height: 220,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
