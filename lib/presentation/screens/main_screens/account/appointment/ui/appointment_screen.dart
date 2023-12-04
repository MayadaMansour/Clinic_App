import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import 'appointment_upComing.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ColorResources.background,
          appBar: AppBar(
            backgroundColor: ColorResources.background,
            title: Text(
              "المواعيد",
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
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: AppointmentUPComing(),
          )),
    );
  }
}
