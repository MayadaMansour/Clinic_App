import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/color_resource/color_resources.dart';
import '../cubit/home_cubit.dart';

class NavHome extends StatelessWidget {
  const NavHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<HomeCubit>(
        create: (_) => HomeCubit(),
        builder: (context, child) {
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (value) {
                      HomeCubit.get(context).changeScreen(value);
                    },
                    currentIndex: HomeCubit
                        .get(context)
                        .currentIndex,
                    selectedItemColor: ColorResources.mainColor,
                    unselectedItemColor: Colors.black38,
                    showUnselectedLabels: false,
                    elevation: 0,
                    backgroundColor: ColorResources.background,
                    type: BottomNavigationBarType.fixed,

                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home_outlined,
                            size: 28,
                          ),
                          label: 'الرئيسيه'),
                      // BottomNavigationBarItem(
                      //     icon: Icon(
                      //       Icons.event_note_outlined,
                      //       size: 28,
                      //     ),
                      //     label: 'المواعيد'),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.chat_outlined,
                            size: 28,
                          ),
                          label: 'المحادثه'),
                      // BottomNavigationBarItem(
                      //     icon: Icon(
                      //       Icons.people_alt_outlined,
                      //       size: 28,
                      //     ),
                      //     label: 'المرضى'),
                      BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.person,
                            size: 28,
                          ),
                          label: 'الحساب'),
                    ],
                  ),
                  body: HomeCubit
                      .get(context)
                      .screens[HomeCubit
                      .get(context)
                      .currentIndex]);
            },
          );
        });
  }

}