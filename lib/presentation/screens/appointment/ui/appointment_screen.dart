import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

class AppointmentScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: ColorResources.background,
     appBar: AppBar(
       backgroundColor:ColorResources.background ,

       title: Text("المواعيد",style: TextStyle(color: ColorResources.mainColor,fontSize: 20,fontWeight: FontWeight.bold),),
       centerTitle: true,
       automaticallyImplyLeading: false,
       elevation: 0,
     ),
   );
  }

}