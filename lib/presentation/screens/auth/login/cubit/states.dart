
abstract class ChatLoginStates {}

class ChatLoginInitialState extends ChatLoginStates {}

class ChatLoginLoadingState extends ChatLoginStates {}

class ChatLoginSuccessState extends ChatLoginStates
{
  //final ShopLoginModel loginModel;

  //ShopLoginSuccessState(this.loginModel);
}

class ChatLoginErrorState extends ChatLoginStates
{
  final String error;

  ChatLoginErrorState(this.error);
}

class ChatChangePasswordVisibilityState extends ChatLoginStates {}