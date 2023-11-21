import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/login/cubit/states.dart';

class ClinicLoginCubit extends Cubit<ChatLoginStates> {
  ClinicLoginCubit() : super(NotfaLoginInitialState());

  static ClinicLoginCubit get(context) => BlocProvider.of(context);

  String phoneNumber = "+91 ";

  void usersLogin({required String email, required String password}) {
    emit(NotfaLoginLoadingState());
    FirebaseAuth.instance
        .signInWithPhoneNumber( phoneNumber,).then((value) {
          emit(NotfaLoginSuccessState());
    }).catchError((error){
      emit(NotfaLoginErrorState(error.toString()));
    });
  }
}


