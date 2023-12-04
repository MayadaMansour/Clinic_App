import 'package:flutter/material.dart';

import '../../../../../../utils/color_resource/color_resources.dart';

class ArticalsPage extends StatelessWidget {
  final String? name, desc, banner, poster, vote, lunch;

  const ArticalsPage(
      {Key? key,
      this.name,
      this.desc,
      this.banner,
      this.poster,
      this.vote,
      this.lunch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorResources.background,
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    banner!,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Text(
                    name!,
                    style: TextStyle(
                        color: ColorResources.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    lunch!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 250,
                      width: 200,
                      child: Image.asset(poster!),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          desc!,
                          style: TextStyle(
                            color: ColorResources.darkGrey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
// Column(
//
// children: [
// Container(
// height: 250,
// width: MediaQuery.of(context).size.width,
// child: Image.asset(
// banner!,
// // fit: BoxFit.cover,
// ),
// ),
// Container(
// padding: EdgeInsets.all(10),
// child: Text(
// name!,
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 20),
// ),
// ),
// Container(
// padding: EdgeInsets.only(left: 20),
// child: Text(
// lunch!,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 14),
// ),
// ),
// // SizedBox(height: 30),
// Row(
// children: [
// Container(
// padding: EdgeInsets.all(5),
// height: 250,
// width: 200,
// child: Image.asset(poster!),
// ),
// Flexible(
// child: Container(
// padding: EdgeInsets.all(5),
// child: Text(
// desc!,
// style: TextStyle(
// color: Colors.black,
// fontSize: 15,
// ),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
