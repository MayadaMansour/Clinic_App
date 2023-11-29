import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/auth/board/board_screen.dart';
import 'package:notfa/presentation/screens/auth/login/ui/login_screen.dart';
import 'package:notfa/presentation/screens/main_screens/nav_bar/ui/home.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';


import 'core/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Widget widget;
  dynamic onBoarding = CachHelper.getData(key: "onBoarding");

  if (onBoarding != null)
    widget = NavHome();
  else
    widget = LoginScreen();
    widget = BoardScreen();

  runApp(ClinicApp(startWidget: widget));
}

class ClinicApp extends StatelessWidget {
  ClinicApp({super.key, this.startWidget});

  Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ColorResources.background,
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
