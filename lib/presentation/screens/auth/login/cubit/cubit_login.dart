import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/auth/login/cubit/states.dart';

class ChatLoginCubit extends Cubit<ChatLoginStates> {
  ChatLoginCubit() : super(ChatLoginInitialState());

  static ChatLoginCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;
  IconData icona = Icons.visibility_outlined;

  // late ShopLoginModel loginModel;

  void changeIcona() {
    showPassword = !showPassword;
    showPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(ChatChangePasswordVisibilityState());
  }

  void usersLogin({required String email, required String password}) {
    emit(ChatLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(ChatLoginSuccessState());
    }).catchError((error){
      emit(ChatLoginErrorState(error.toString()));
    });
  }
}



