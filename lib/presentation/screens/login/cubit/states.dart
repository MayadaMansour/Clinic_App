
abstract class ChatLoginStates {}

class NotfaLoginInitialState extends ChatLoginStates {}

class NotfaLoginLoadingState extends ChatLoginStates {}
class NotfaLoginSuccessState extends ChatLoginStates{}
class NotfaLoginErrorState extends ChatLoginStates
{
  final String error;
  NotfaLoginErrorState(this.error);
}
