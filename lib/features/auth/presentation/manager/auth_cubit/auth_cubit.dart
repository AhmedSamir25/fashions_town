import 'package:fashionstown/features/auth/data/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(InitialAppState());

  void registerWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _authRepository.registerWithEmail(email, password, name);
      emit(UserSignSuccessState());
    } catch (e) {
      emit(FeiledCreatedUserState(massage: e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      await _authRepository.signIn(email, password);
      emit(UserSignSuccessState());
    } catch (e) {
      emit(FeiledCreatedUserState(massage: e.toString()));
    }
  }

  void signInWithGoogle() async {
    try {
      await _authRepository.signInWithGoogle();
      emit(UserSignSuccessState());
    } catch (e) {
      emit(FeiledCreatedUserState(massage: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _authRepository.resetPassword(email);
      emit(SuccessResetPasswordState());
    } catch (e) {
      emit(FeiledResetPasswordState(massage: e.toString()));
    }
  }
}
