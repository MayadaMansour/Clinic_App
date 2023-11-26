import 'package:flutter/material.dart';

import '../../../../../utils/images/images.dart';

class RecommendedArticals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            Column(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 150,
                    height: 180,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.artical),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    "عنوان المقاله",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
        separatorBuilder: (BuildContext context, int index) {
          return   SizedBox(width: 10,);

        }, itemCount: 3,),
    );
  }
}
