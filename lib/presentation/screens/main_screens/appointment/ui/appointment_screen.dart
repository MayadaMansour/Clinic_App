import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../widget/appointment_card.dart';
import '../widget/filter_state.dart';
import '../widget/time_card.dart';

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
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}



class _AppointmentScreenState extends State<AppointmentScreen> {


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
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
                  height: 45,
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
                      Tab(text: 'Received',),
                      Tab(text: 'Accepted',),
                      Tab(text: 'On the way',),
                    ],
                  ),
                ),
                 Expanded(
                    child: TabBarView(
                      children:  [
                        AppointmentCard()




                      ],
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}

    // return Scaffold(
    //   backgroundColor: ColorResources.background,
    //   appBar: AppBar(
    //     backgroundColor: ColorResources.background,
    //     title: Text(
    //       "المواعيد",
    //       style: TextStyle(
    //           color: ColorResources.mainColor,
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold),
    //     ),
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     elevation: 0,
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.only(right: 10),
    //         child: IconButton(
    //             onPressed: () {},
    //             icon: Icon(
    //               Icons.notification_add,
    //               color: ColorResources.mainColor,
    //               size: 30,
    //             )),
    //       )
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               height: 50,
    //               decoration: BoxDecoration(
    //                 color: ColorResources.mainColor,
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   for (FilterStatus filterStatus in FilterStatus.values)
    //                     Expanded(
    //                       child: GestureDetector(
    //                         onTap: () {
    //                           setState(() {
    //                             if (filterStatus == FilterStatus.Upcoming) {
    //                               status = FilterStatus.Upcoming;
    //                               _alignment = Alignment.centerLeft;
    //                             } else if (filterStatus ==
    //                                 FilterStatus.Complete) {
    //                               status = FilterStatus.Complete;
    //                               _alignment = Alignment.center;
    //                             } else if (filterStatus ==
    //                                 FilterStatus.Cancel) {
    //                               status = FilterStatus.Cancel;
    //                               _alignment = Alignment.centerRight;
    //                             }
    //                           });
    //                         },
    //                         child: Center(
    //                           child: Text(
    //                             filterStatus.name,
    //                             // style: kFilterStyle,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                 ],
    //               ),
    //             ),
    //             AnimatedAlign(
    //               duration: Duration(milliseconds: 200),
    //               alignment: _alignment,
    //               child: Container(
    //                 width: 100,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                   // color: Colors.white,
    //                   borderRadius: BorderRadius.circular(20),
    //                 ),
    //                 child: Center(
    //                   child: Text(
    //                     status.name,
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: filteredSchedules.length,
    //             itemBuilder: (context, index) {
    //               bool isLastElement = filteredSchedules.length + 1 == index;
    //               return Card(
    //                 margin: !isLastElement
    //                     ? EdgeInsets.only(bottom: 20)
    //                     : EdgeInsets.zero,
    //                 child: Padding(
    //                   padding: EdgeInsets.all(15),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.stretch,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           CircleAvatar(
    //                               // backgroundImage: AssetImage(_schedule['img']),
    //                               ),
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 'doctorName',
    //                                 style: TextStyle(
    //                                   // color: Color(MyColors.header01),
    //                                   fontWeight: FontWeight.w700,
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 height: 5,
    //                               ),
    //                               Text(
    //                                 'doctorTitle',
    //                                 style: TextStyle(
    //                                   // color: Color(MyColors.grey02),
    //                                   fontSize: 12,
    //                                   fontWeight: FontWeight.w600,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 15,
    //                       ),
    //                       DateTimeCard(),
    //                       SizedBox(
    //                         height: 15,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Expanded(
    //                             child: ElevatedButton(
    //                               onPressed: () {},
    //                               style: ElevatedButton.styleFrom(
    //                                 primary: Colors.white,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(25),
    //                                 ),
    //                               ),
    //                               child: Text(
    //                                 'إلغاء',
    //                                 style: TextStyle(
    //                                     color: ColorResources.mainColor),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 20,
    //                           ),
    //                           Expanded(
    //                             child: ElevatedButton(
    //                               onPressed: (){},
    //                               style: ElevatedButton.styleFrom(
    //                                 primary: ColorResources.mainColor,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(25),
    //                                 ),
    //                               ),
    //                               child: Text(
    //                                 'إعاده',
    //                                 style: TextStyle(color: Colors.white),
    //                               ),
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

