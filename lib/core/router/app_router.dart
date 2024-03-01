import 'package:fashionstown/features/auth/presentation/view/sign_in_view.dart';
import 'package:fashionstown/features/auth/presentation/view/sign_up_view.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/forgot_password.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:fashionstown/core/utils/bottom_navigation_bar.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/show_category_items.dart';
import 'package:fashionstown/features/home_details/presentation/view/home_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_details/presentation/manager/cubit/product_details_cubit.dart';

abstract class AppRouter {
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forgotPassword = '/ForgotPassword';
  static const homeView = '/';
  static const showCategoryItems = '/ShowCategoryItems';
  static const homeDetailsView = '/homeDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: signIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => ForgotPassword(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const BottomNavigationBarGNav(),
      ),
      GoRoute(
        path: showCategoryItems,
        builder: (context, state) { 
          final value = state.extra as String;
          return BlocProvider(
          create: (context) => ProductCubit()..getProductCategory(productCategory: value),
          child:  ShowCategoryItems(categoryName: value),
        );
        }
      ),
      GoRoute(
        path: homeDetailsView,
        builder: (context, state) {
          final value = state.extra as String;
          return BlocProvider(
            create: (context) => ProductDetailsCubit()..getProductData(productId: value),
            child: const HomeViewDetails());},
      )
    ],
  );
}
