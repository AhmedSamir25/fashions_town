import 'package:fashionstown/core/utils/check_login_state.dart';
import 'package:fashionstown/features/auth/data/repository/auth_repo.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Fashionstown());
}

class Fashionstown extends StatelessWidget {
  const Fashionstown({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final AuthRepository authRepository = AuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepository),
        ),
      ],
      child: const CheckUserLogin(),
    );
  }
}