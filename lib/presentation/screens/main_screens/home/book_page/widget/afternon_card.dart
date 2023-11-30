import 'package:flutter/material.dart';

import '../../../../../../utils/color_resource/color_resources.dart';

class AfterNoonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 60,
                height: 50,
                decoration: ShapeDecoration(
                  color: ColorResources.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "07:00",
                        style: TextStyle(
                            color: ColorResources.darkGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
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
