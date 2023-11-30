import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/auth/login/ui/login_screen.dart';

import '../../../../../utils/color_resource/color_resources.dart';
import '../../../../../utils/images/images.dart';
import '../../../../widget/widgets/coustoms/coustom_bottom.dart';
import '../../../../widget/widgets/coustoms/coustom_text_form.dart';

import '../../../main_screens/home/home_page/ui/home_screen.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, ChatRegisterState>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: ColorResources.background,
            appBar: AppBar(
              title: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Text(
                  "إتشاء حساب",
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                      height: 30,
                    ),
                    CoustomTextForm(
                      controller: emailController,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "برجاء إدخال البريد الإلكتروني ";
                        }
                        return null;
                      },
                      label: "البريد الإلكترونى",
                      text: TextInputType.emailAddress,
                      museTextColor: ColorResources.mainColor,
                      borderColor: ColorResources.mainColor,
                      borderReduse: 10,
                      labelColor: Colors.grey,
                      userTextColor: Colors.black,
                      prefIcon: Icons.email_outlined,
                      prefIconColor: ColorResources.mainColor,
                      passwordText: false,
                    ),
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
                              : const Icon(Icons.visibility_off_outlined)),
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
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).usersRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                phone: phoneController.text);
                          }
                        },
                        text: "إنشاء حساب"),
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
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text(
                              "التسجيل",
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
              ),
            ),
          );
        },
      ),
    );
  }
}
