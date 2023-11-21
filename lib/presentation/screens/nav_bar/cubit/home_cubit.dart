import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/account/ui/account_screen.dart';
import 'package:notfa/presentation/screens/appointment/ui/appointment_screen.dart';
import 'package:notfa/presentation/screens/chat/ui/chat_screen.dart';
import 'package:notfa/presentation/screens/patient/ui/patient_screen.dart';

import '../../home/ui/home_screen.dart';
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
