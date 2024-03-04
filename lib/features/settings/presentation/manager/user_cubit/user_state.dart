part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class SuccessGetUserData extends UserState {
    final List userInfo;
   const  SuccessGetUserData({required this.userInfo});
}

final class FieldGetUserData extends UserState {
  final String massage;
  const FieldGetUserData({required this.massage});
}

final class LodaingGetUserData extends UserState {}

final class UpdateUserAdressSuccess extends UserState{}

final class UpdateUserPhoneSuccess extends UserState{}
