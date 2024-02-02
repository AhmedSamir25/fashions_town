abstract class AuthState {}

class InitialAppState extends AuthState{}

class UserSignSuccessState extends AuthState {}

class FeiledCreatedUserState extends AuthState {
  String massage;
  FeiledCreatedUserState({required  this.massage});
}

class FeiledSendUserDataState extends AuthState {
  String massage;
  FeiledSendUserDataState({required  this.massage});
}