import 'package:fashionstown/features/auth/presentation/view/sign_in_view.dart';
import 'package:fashionstown/features/auth/presentation/view/sign_up_view.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/forgot_password.dart';
import 'package:fashionstown/features/home/presentation/view/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
   static const signIn = '/';
   static const signUp = '/signUp';
   static const forgotPassword = '/ForgotPassword';
   static const homeView = '/HomeView';
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
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(path: homeView,
      builder: (context, state) => const HomeView(),
      ),
    ],
      );
}