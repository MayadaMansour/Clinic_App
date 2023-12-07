import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:notfa/presentation/screens/main_screens/home/book_page/widget/afternon_card.dart';
import 'package:notfa/presentation/screens/main_screens/home/book_page/widget/night_card.dart';

import '../../../../../../utils/bottons/icons_botton.dart';
import '../../../../../../utils/color_resource/color_resources.dart';
import '../../../../../../utils/images/images.dart';
import '../../dialog/dialogs.dart';

import '../../../../../../utils/bottons/icons_layout_bottons.dart';
import '../widget/days_card.dart';
import '../widget/morning_card.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorResources.background,
          appBar: AppBar(
            backgroundColor: ColorResources.background,
            title: Text(
              "الحجز",
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.only(left: 10, top: 90),
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
                    Text(
                      'الأيام:',
                      style: TextStyle(
                          color: ColorResources.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    DaysCard(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'المواعيد الصباحيه:',
                      style: TextStyle(
                          color: ColorResources.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    MorningCard(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'المواعيد الظهيره:',
                      style: TextStyle(
                          color: ColorResources.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    AfterNoonCard(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'المواعيد المسائيه:',
                      style: TextStyle(
                          color: ColorResources.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    NightCard(),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Dialogs.bottomMaterialDialog(
                  msg:
                      'إذا كنت ترغب بتأكيد الحجز برجاء القدوم إلى العياده قبل الميعاد المختار بساعه',
                  title: 'تأكيد الحجز',
                  msgStyle: TextStyle(fontSize: 18),
                  context: context,
                  actions: [
                    IconsButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.rightSlide,
                          title: 'تم',
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22),
                          dialogBackgroundColor: ColorResources.background,
                          desc: 'تم تأكيد الحجز بنجاح ',
                          autoHide: Duration(seconds: 4),
                        )..show();
                      },
                      text: 'تأكيد',
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      iconData: Icons.done_outline_sharp,
                      color: ColorResources.mainColor,
                      textStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                    IconsOutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'ألغاء',
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      iconData: Icons.cancel_outlined,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                  ]);
            },
            label: const Text(
              "تأكيد الحجز",
              style: TextStyle(fontSize: 20),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            foregroundColor: Colors.white,
            backgroundColor: ColorResources.mainColor,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }

// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: Text("إلغاء"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
//   Widget continueButton = TextButton(
//     child: Text("تأكيد"),
//     onPressed: () {},
//   );
//
//
//   AlertDialog alert = AlertDialog(
//     title: Text("تأكيد الحجز"),
//     content: Text(
//         "إذا كنت ستأكد الحجز الرجاء بالقدوم إلى العياده قبل الميعاد المختار بساعه "),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
}
