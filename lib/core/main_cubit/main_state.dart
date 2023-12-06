abstract class NotfaState{}
class NotfaInitialState extends NotfaState{}
class NotfaGetUserLoadingState extends NotfaState{}
class NotfaGetUserSucessState extends NotfaState{}
class NotfaGetUserErrorState extends NotfaState{
  final String error;
  NotfaGetUserErrorState(this.error);

}