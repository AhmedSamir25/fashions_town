import 'package:fashionstown/core/helper/cubit/check_internet_cubit.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/utils/check_login_state.dart';
import 'package:fashionstown/features/auth/data/repository/auth_repo.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/dark_cubit/theme_mode_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/user_cubit/user_cubit.dart';
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
  await SaveThemeMode.cacheInitialization();
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
         BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(),),
        //BlocProvider(create: (context)=> CheckInternetCubit()..checkConnectivity()),
        BlocProvider(create: (context)=> ProductCubit()..getProductData()),
        BlocProvider(create: (context) => SearchCubit()..fetchProductsStream()),
        BlocProvider(create: (context) => CartCubit()..getCartData()),
        BlocProvider(create: (context) => FavoriteCubit()..getFavoriteData(),),
        BlocProvider(create: (context) => UserCubit()..getUserData()),
        BlocProvider(create: (context) => ThemeModeCubit()..themeMode(value: SaveThemeMode().getTheme())),
        BlocProvider(create: (context) => OrderCubit()..getOrderData(),)
      ],
      child: const CheckUserLogin(),
    );
  }
}