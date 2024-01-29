abstract class AuthState {}

class InitialAppState extends AuthState{}

class UserCreatedSuccessState extends AuthState {}

class FeiledCreatedUserState extends AuthState {
  String massage;
  FeiledCreatedUserState({required  this.massage});
}