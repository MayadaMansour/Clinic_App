import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import '../../../../utils/images/images.dart';
import '../login/ui/login_screen.dart';


class BoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BoardScreenState();
  }
}

class _BoardScreenState extends State<BoardScreen> {

  void initState()  {
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
      LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: ColorResources.background
              ),
              child: Image(
                image: AssetImage(Images.logo),
                fit: BoxFit.contain,
              ));
  }
}
