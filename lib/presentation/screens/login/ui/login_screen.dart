import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/home/ui/home_screen.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import '../../../../utils/images/images.dart';
import '../../../widget/widgets/coustoms/coustom_bottom.dart';
import '../../../widget/widgets/coustoms/coustom_text_form.dart';
import '../../../widget/widgets/coustoms/coustom_toast.dart';
import '../../nav_bar/ui/home.dart';
import '../cubit/cubit_login.dart';
import '../cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build( context) {
    // return BlocProvider(
    //   create: (context) => ClinicLoginCubit(),
    //   child: BlocConsumer<ClinicLoginCubit, ChatLoginStates>(
    //     listener: (context, state) {
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  NavHome()),
    //               (route) => false);
    //       if (state is NotfaLoginErrorState) {
    //           coustomToast(
    //             text: state.error,
    //             state: ToastStates.ERROR,
    //           );
    //         }
    //
    //     },
    //     builder: (context, state) {
    //       ClinicLoginCubit cubit = ClinicLoginCubit.get(context);
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Container(
    //             alignment: Alignment.topRight,
    //             child: Text(
    //               "تسجيل الدخول",
    //               style: TextStyle(
    //                   color: ColorResources.mainColor,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25),
    //             ),
    //           ),
    //           backgroundColor: Colors.transparent,
    //           elevation: 0,
    //         ),
    //         backgroundColor: ColorResources.background,
    //         body: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: Form(
    //             key: formKey,
    //             child: ListView(
    //               children: [
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Center(
    //                       child: Container(
    //                         height: 200,
    //                         width: 250,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(50),
    //                             image: const DecorationImage(
    //                                 fit: BoxFit.cover,
    //                                 image: AssetImage(
    //                                     Images.logo))),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     CoustomTextForm(
    //                         validator: (data) {
    //                           if (data!.isEmpty) {
    //                             return "الرجاء التأكد من دخول الأسم ";
    //                           } else {
    //                             return null;
    //                           }
    //                         },
    //                         prefIconColor: ColorResources.mainColor ,
    //                         prefIcon: Icons.person,
    //                         controller: emailController,
    //                         passwordText: false,
    //                         label: "أسم المستخدم",
    //                         text: TextInputType.emailAddress,
    //                         museTextColor: ColorResources.background,
    //                         borderColor: ColorResources.mainColor,
    //                         borderReduse: 10,
    //                         labelColor: Colors.grey,
    //                         userTextColor: Colors.black),
    //                     SizedBox(
    //                       height: 20,
    //                     ),
    //                     CoustomTextForm(
    //                         validator: (data) {
    //                           if (data!.isEmpty) {
    //                             return "الرجاء التأكد من رقم الهاتف ";
    //                           } else {
    //                             return null;
    //                           }
    //                         },
    //                         prefIconColor: ColorResources.mainColor ,
    //                         prefIcon: Icons.phone_enabled,
    //                         controller: passwordController,
    //                         passwordText:false,
    //                         label: "رقم الهاتف",
    //                         text: TextInputType.visiblePassword,
    //                         museTextColor: Colors.grey,
    //                         borderColor: ColorResources.mainColor,
    //                         borderReduse: 10,
    //                         labelColor: Colors.grey,
    //                         userTextColor: Colors.black),
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     ConditionalBuilder(
    //                       condition: state is! NotfaLoginLoadingState,
    //                       builder: (context) => coustomBottom(
    //                           textColor: Colors.white,
    //                           bgColor: ColorResources.mainColor,
    //                           onTap: () {
    //                             if (formKey.currentState!.validate()) {
    //                               cubit.usersLogin(
    //                                   email: emailController.text,
    //                                   password: passwordController.text);
    //                             }
    //                           },
    //                           text: "الدخول "),
    //                       fallback: (context) => const Center(
    //                           child: CircularProgressIndicator(
    //                         color: Colors.grey,
    //                       )),
    //                     ),
    //                     SizedBox(
    //                       height: 15,
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(right: 10),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           TextButton(
    //                             onPressed: () {
    //                               // Navigator.push(
    //                               //     context,
    //                               //     MaterialPageRoute(
    //                               //       builder: (context) =>
    //                               //           RegisterScreen(),
    //                               //     ));
    //                             },
    //                             child:  Text(
    //                               "إنشاء حساب جديد",
    //                               style: TextStyle(
    //                                   color: ColorResources.mainColor,
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                           ),
    //                           const Text(
    //                             "هل لديك حساب قديم ؟",
    //                             style: TextStyle(
    //                                 color: Colors.grey,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
     return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topRight,
          child: Text(
            "تسجيل الدخول",
            style: TextStyle(
                color: ColorResources.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: ColorResources.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  Images.logo))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CoustomTextForm(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "الرجاء التأكد من دخول الأسم ";
                        } else {
                          return null;
                        }
                      },
                      prefIconColor: ColorResources.mainColor ,
                      prefIcon: Icons.person,
                      controller: emailController,
                      passwordText: false,
                      label: "أسم المستخدم",
                      text: TextInputType.emailAddress,
                      museTextColor: ColorResources.background,
                      borderColor: ColorResources.mainColor,
                      borderReduse: 10,
                      labelColor: Colors.grey,
                      userTextColor: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  CoustomTextForm(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "الرجاء التأكد من رقم الهاتف ";
                        } else {
                          return null;
                        }
                      },
                      prefIconColor: ColorResources.mainColor ,
                      prefIcon: Icons.phone_enabled,
                      controller: passwordController,
                      passwordText:false,
                      label: "رقم الهاتف",
                      text: TextInputType.visiblePassword,
                      museTextColor: Colors.grey,
                      borderColor: ColorResources.mainColor,
                      borderReduse: 10,
                      labelColor: Colors.grey,
                      userTextColor: Colors.black),
                  SizedBox(
                    height: 30,
                  ),
                  // ConditionalBuilder(
                  //   condition: state is! NotfaLoginLoadingState,
                  //   builder: (context) =>
             coustomBottom(
                        textColor: Colors.white,
                        bgColor: ColorResources.mainColor,
                        // onTap: () {
                        //   if (formKey.currentState!.validate()) {
                        //     cubit.usersLogin(
                        //         email: emailController.text,
                        //         password: passwordController.text);
                        //   }
                        // },
                        text: "الدخول ", onTap: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) =>
                         NavHome(),
                   ));
             }),
                    // fallback: (context) => const Center(
                    //     child: CircularProgressIndicator(
                    //       color: Colors.grey,
                    //     )),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           RegisterScreen(),
                            //     ));
                          },
                          child:  Text(
                            "إنشاء حساب جديد",
                            style: TextStyle(
                                color: ColorResources.mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "هل لديك حساب قديم ؟",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            // ],
          ),
        ),
      // ),
    );
  }
}
