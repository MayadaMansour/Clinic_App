import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import '../../../../../core/local/cache_helper.dart';
import '../../../../../utils/images/images.dart';
import '../../../../widget/widgets/coustoms/coustom_bottom.dart';
import '../../../../widget/widgets/coustoms/coustom_text_form.dart';
import '../../../../widget/widgets/coustoms/coustom_toast.dart';

import '../../../main_screens/home/home_page/ui/home_screen.dart';
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
          if (state is ChatLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                HomeScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          ChatLoginCubit cubit = ChatLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              toolbarHeight: 60,
            ),
            backgroundColor: ColorResources.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              height: 230,
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
                                  return "الرجاء التأكد من دخول البريد الإلكتروني ";
                                } else {
                                  return null;
                                }
                              },
                              prefIconColor: ColorResources.mainColor,
                              prefIcon: Icons.email,
                              controller: emailController,
                              passwordText: false,
                              label: "البريد الإلكتروني",
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
                          TextButton(
                              onPressed: () async {
                                if (emailController.text == "") {
                                  coustomToast(
                                    text: "برجاء كتابه البريد الإلكتروني أولا",
                                    state: ToastStates.WARNING,
                                  );
                                  return;
                                }
                                try {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: emailController.text);
                                  coustomToast(
                                    text:
                                        "تم إرسال رابط لإعاده تعين كلمه المرور",
                                    state: ToastStates.SUCCESS,
                                  );
                                } catch (e) {
                                  coustomToast(
                                    text: "برجاء إدخال بريد إلكتروني صحيح",
                                    state: ToastStates.ERROR,
                                  );
                                }
                              },
                              child: Text("لم تتذكر كلمه المرور؟")),
                          SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! ChatLoginLoadingState,
                            builder: (context) => coustomBottom(
                                textColor: Colors.white,
                                bgColor: ColorResources.mainColor,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: "الدخول"),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            )),
                          ),
                        ]),
                    SizedBox(
                      height: 3,
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
