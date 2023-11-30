import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../account/ui/account_screen.dart';
import '../../appointment/ui/appointment_screen.dart';
import '../../chat/ui/chat_room.dart';
import '../../chat/ui/chat_screen.dart';
import '../../home/home_page/ui/home_screen.dart';

import '../../patient/ui/patient_screen.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List screens = [
    HomeScreen(),
    AppointmentScreen(),

    ChatScreen(),
    PatientScreen(),
    AccountScreen(),
  ];

  int currentIndex = 0;

  changeScreen(index) {
    currentIndex = index;
    emit(ChangeScreen());
  }


}
