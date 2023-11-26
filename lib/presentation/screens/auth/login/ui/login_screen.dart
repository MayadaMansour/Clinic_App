import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../../../../../utils/images/images.dart';
import '../../../../widget/widgets/coustoms/coustom_bottom.dart';
import '../../../../widget/widgets/coustoms/coustom_text_form.dart';
import '../../../../widget/widgets/coustoms/coustom_toast.dart';
import '../../../main_screens/home/ui/home_screen.dart';
import '../../../main_screens/nav_bar/ui/home.dart';
import '../../register/ui/register_screen.dart';
import '../cubit/cubit_login.dart';
import '../cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => ChatLoginCubit(),
      child: BlocConsumer<ChatLoginCubit, ChatLoginStates>(
        listener: (context, state) {
          if (state is ChatLoginErrorState) {
            coustomToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        },
        builder: (context, state) {
          ChatLoginCubit cubit = ChatLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
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
              toolbarHeight: 80,
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
                              height: 250,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(Images.logo))),
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
                              prefIconColor: ColorResources.mainColor,
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
                            height: 30,
                          ),
                          CoustomTextForm(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "برجاء إدخال كلمه المرور";
                              }
                              return null;
                            },
                            passwordText: cubit.showPassword,
                            label: "كلمه المرور",
                            text: TextInputType.visiblePassword,
                            museTextColor: ColorResources.mainColor,
                            borderColor: ColorResources.mainColor,
                            borderReduse: 10,
                            labelColor: Colors.grey,
                            userTextColor: Colors.black,
                            suffixIcone: IconButton(
                                onPressed: () {
                                  cubit.changeIcona();
                                },
                                icon: cubit.showPassword
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(
                                        Icons.visibility_off_outlined)),
                            prefIcon: Icons.lock,
                            prefIconColor: ColorResources.mainColor,
                            suffixIconeColor: ColorResources.mainColor,
                          ),
                          SizedBox(
                            height: 30,
                          ),
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
                            text: "الدخول ",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavHome(),
                                  ));
                            }),

                        ]),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: Text(
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
        },
      ),
    );
  }
}
