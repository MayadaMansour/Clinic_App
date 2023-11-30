import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:notfa/presentation/screens/main_screens/home/doctor_profile/ui/doctors_profile.dart';

import '../../../../../../utils/images/images.dart';

class RecommendedDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorProfile(),
                    ));
              },
              child: Container(
                width: 187,
                height: 230,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.man),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            Positioned(
              bottom: 0.3,
              child: Container(
                height: 50,
                width: 187,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)), //BorderRadius.all
                ), //BoxDecoration
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 15, top: 15),
                      child: Text(
                        "إسم الطبيب ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
