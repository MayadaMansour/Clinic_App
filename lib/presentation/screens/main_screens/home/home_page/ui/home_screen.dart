import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/core/main_cubit/cubit_main.dart';
import 'package:notfa/core/main_cubit/main_state.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import '../../../../../widget/widgets/coustoms/coustom_toast.dart';
import '../widget/recommended_doctors.dart';
import '../widget/recommended_articals.dart';
import '../widget/slider_pannar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotfaCubit, NotfaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: NotfaCubit.get(context).model != null,
            builder: (context) {
              var model = FirebaseAuth.instance.currentUser!.emailVerified;
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
                          if (!model)
                            Container(
                              height: 40,
                              color: Colors.amber.withOpacity(0.4),
                              child: Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.currentUser!
                                            .sendEmailVerification()
                                            .then((value) {
                                          coustomToast(
                                            text: "تأكد من بريدك الإلكتروني",
                                            state: ToastStates.SUCCESS,
                                          );
                                        }).catchError((error) {});
                                      },
                                      child: Text("إرسال")),
                                  Spacer(),
                                  Text("برجاء التأكد من البريد الإلكترونى"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(Icons.info_outlined),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          SliderPannar(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ':الأطباء الموصي بيهم',
                            style: TextStyle(
                                color: ColorResources.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RecommendedDoctors(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ':المقالات الأكثر شيوعا ',
                            style: TextStyle(
                                color: ColorResources.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RecommendedArticals()
                        ],
                      ),
                    ),
                  ),
                )),
              );
            },
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
