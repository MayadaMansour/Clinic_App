import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfa/presentation/screens/main_screens/appointment/ui/appointment_accepted.dart';
import 'package:notfa/presentation/screens/main_screens/appointment/ui/appointment_onWay.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../widget/appointment_card.dart';
import '../widget/time_card.dart';
import 'appointment_upComing.dart';

// class AppointmentScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: ColorResources.background,
//      appBar: AppBar(
//        backgroundColor:ColorResources.background ,
//
//        title: Text("المواعيد",style: TextStyle(color: ColorResources.mainColor,fontSize: 20,fontWeight: FontWeight.bold),),
//        centerTitle: true,
//        automaticallyImplyLeading: false,
//        elevation: 0,
//      ),
//    );
//   }
//
// }
class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
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
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    child:  TabBar(
                      indicator: BoxDecoration(
                          color: ColorResources.mainColor,
                          borderRadius:  BorderRadius.circular(25.0)
                      ) ,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const  [
                        Tab(text: 'إستيلام',),
                        Tab(text: 'مقبول ',),
                        Tab(text: 'إنتظار',),
                      ],
                    ),
                  ),
                   Expanded(
                      child: TabBarView(
                        children:  [
                          AppointmentUPComing(),
                          AppointmentAccepted(),
                          AppointmentOnTheWay()

                        ],
                      )
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}

