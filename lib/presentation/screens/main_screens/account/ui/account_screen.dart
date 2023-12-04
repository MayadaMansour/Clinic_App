import 'package:flutter/material.dart';
import 'package:notfa/presentation/screens/main_screens/account/profile/ui/profile_screen.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../../../../../utils/images/images.dart';
import '../appointment/ui/appointment_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorResources.background,
        appBar: AppBar(
          backgroundColor: ColorResources.background,
          title: Text(
            "الحساب الشخصي",
            style: TextStyle(
                color: ColorResources.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      decoration: ShapeDecoration(
                        color: ColorResources.mainColor,
                        image: DecorationImage(
                            image: AssetImage(Images.pannar),
                            fit: BoxFit.fill,
                            alignment: Alignment.centerLeft),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 90),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(Images.man),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 180,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: new Offset(10.0, 10.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "الحساب الشخصي",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen(),
                                            ));
                                      },
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.event_note_outlined),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "جدول المواعيد",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.notification_add),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "الإشعارات",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Icon(Icons.message),
                              //     SizedBox(width: 15,),
                              //     TextButton(onPressed: (){}, child: Text(
                              //       "الرسائل",
                              //       style: TextStyle(
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 18),
                              //     ),),
                              //     Spacer(),
                              //     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 180,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: new Offset(10.0, 10.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.settings),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "الإعدادات",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.help),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "المساعده",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.login),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "الخروج",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
