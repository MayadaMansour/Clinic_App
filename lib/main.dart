import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/core/main_cubit/main_state.dart';
import 'package:notfa/presentation/screens/auth/board/board_screen.dart';
import 'package:notfa/presentation/screens/auth/login/ui/login_screen.dart';
import 'package:notfa/presentation/screens/main_screens/home/home_page/ui/home_screen.dart';
import 'package:notfa/presentation/screens/main_screens/nav_bar/ui/home.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import 'constant.dart';
import 'core/local/cache_helper.dart';
import 'core/main_cubit/cubit_main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp();

  // DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token = CacheHelper.getData(key: 'token');

   var uId = CacheHelper.getData(key: 'uId');

  // if(onBoarding != null)
  // {
  //   if(token != null) widget = ShopLayout();
  //   else widget = ShopLoginScreen();
  // } else
  //   {
  //     widget = OnBoardingScreen();
  //   }

  if (uId != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(ClinicApp(
    startWidget: widget,
  ));
}

class ClinicApp extends StatelessWidget {
  ClinicApp({super.key, this.startWidget});

  Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotfaCubit()
        ..getUserData(),
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
       ),
    );
  }
}
