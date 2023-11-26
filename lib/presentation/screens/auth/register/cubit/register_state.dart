abstract class ChatRegisterState {}

class RegisterInitial extends ChatRegisterState {}
class LoginChangeIcon extends ChatRegisterState {}


class ChatRegisterLoadingState extends ChatRegisterState {}
class ChatRegisterSuccessState extends ChatRegisterState
{
  //final ShopLoginModel loginModel;

  //ShopLoginSuccessState(this.loginModel);
}
class ChatRegisterErrorState extends ChatRegisterState
{
  final String error;

  ChatRegisterErrorState(this.error);
}



class CreateUserLoadingState extends ChatRegisterState {}
class CreateUserSuccessState extends ChatRegisterState
{
  //final ShopLoginModel loginModel;

  //ShopLoginSuccessState(this.loginModel);
}
class CreateUserErrorState extends ChatRegisterState
{
  final String error;

  CreateUserErrorState(this.error);
}


class ChatChangePasswordVisibilityState extends ChatRegisterState {}