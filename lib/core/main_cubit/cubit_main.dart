import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/constant.dart';
import 'package:notfa/core/main_cubit/main_state.dart';

import '../../presentation/screens/auth/register/model/user_model.dart';

class NotfaCubit extends Cubit<NotfaState>{
  NotfaCubit(): super(NotfaInitialState());
  static NotfaCubit get(context) => BlocProvider.of(context);

    UserModel? model;


  void getUserData() {
    emit(NotfaGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = UserModel.fromJson(value.data()!);
      emit(NotfaGetUserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NotfaGetUserErrorState(error.toString()));
    });
  }

  }


