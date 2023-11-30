import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import '../widget/recommended_doctors.dart';
import '../widget/recommended_articals.dart';
import '../widget/slider_pannar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.background,
      appBar: AppBar(
        backgroundColor: ColorResources.background,
        title: Text(
          "الصفحه الرئيسيه",
          style: TextStyle(
              color: ColorResources.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_add,
                  color: ColorResources.mainColor,
                  size: 30,
                )),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SliderPannar(),
                SizedBox(height: 20,),
                Text(
                  ':الأطباء الموصي بيهم',
                  style: TextStyle(color: ColorResources.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                NearBy(),
                SizedBox(height: 20,),
                Text(
                   ':المقالات الأكثر شيوعا ',
                  style: TextStyle(color: ColorResources.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                RecommendedArticals()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
