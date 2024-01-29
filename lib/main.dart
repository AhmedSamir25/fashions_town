import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
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
    return MultiBlocProvider(
      providers: [
         BlocProvider(
          create: (context) =>AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fashions Town',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:appColor),
          useMaterial3: true,
        ),
         routerConfig: AppRouter.router,
      ),
    );
  }
}