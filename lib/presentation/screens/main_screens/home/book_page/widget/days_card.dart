import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../../../../../../utils/images/images.dart';

class DaysCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 75,
                height: 70,
                decoration: ShapeDecoration(
                  color: ColorResources.mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  "نوفمبر",
                  style: TextStyle(
                      color: ColorResources.lightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "30 ",
                  style: TextStyle(
                      color: ColorResources.lightGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "الأثنين ",
                  style: TextStyle(
                      color: ColorResources.lightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                  ],
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
        itemCount: 15,
      ),
    );
  }
}
