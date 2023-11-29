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
                          color: ColorResources.mainColor,
                          image: DecorationImage(
                              image: AssetImage(Images.pannar),
                              fit: BoxFit.fill,
                              alignment: Alignment.centerLeft),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            // side: BorderSide(
                            //     color: ColorResources.mainColor, width: 2)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 15, right: 15, left: 180),
                  child: Text(
                    "أبحث واحجز كشف مع دكتور في عيادة، مستشفى، زيارة منزلية، أو عبر مكالمة صوتية أو مكالمة فيديو مع طبيبك الخاص",
                    maxLines: 4,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ]))
          .toList(),
      options: CarouselOptions(
        height: 200,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
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
