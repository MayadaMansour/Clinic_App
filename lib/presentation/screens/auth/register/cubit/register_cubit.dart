
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/presentation/screens/auth/register/cubit/register_state.dart';

import '../../login/cubit/states.dart';
import '../model/user_model.dart';

class RegisterCubit extends Cubit<ChatRegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;
  IconData icona = Icons.visibility_outlined;


  void changeIcona() {
    showPassword = !showPassword;
    showPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(LoginChangeIcon());
  }


  void usersRegister(
      {required String email,
        required String password,
        required String name,
        required String phone}) {
    emit(ChatRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
          password: password,
          email: email,
          name: email,
          phone: phone,
          uId: value.user!.uid);
      emit(ChatRegisterSuccessState());
    }).catchError((error) {
      emit(ChatRegisterErrorState(error.toString()));
    });
  }

  void createUser(
      {required String email,
        required String password,
        required String name,
        required String phone,
        required String uId}) {
    UserModel model = UserModel(
        name: name, email: email, phone: phone, password: password, uId: uId);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

}
