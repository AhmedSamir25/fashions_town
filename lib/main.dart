import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/core/utils/check_login_state.dart';
import 'package:fashionstown/features/auth/data/repository/auth_repo.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SetUserId.cacheInitialization();
  runApp(const Fashionstown());
}

class Fashionstown extends StatelessWidget {
  const Fashionstown({super.key});
  @override
  Widget build(BuildContext context) {
     final AuthRepository authRepository = AuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authRepository),),
        BlocProvider(create: (context)=> ProductCubit()..getProductData()),
        BlocProvider(create: (context) => SearchCubit()..fetchProductsStream()),
        BlocProvider(create: (context) => CartCubit()..getCartData())
      ],
      child: const CheckUserLogin(),
    );
  }
}