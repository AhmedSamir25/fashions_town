import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_text_field_sign.dart';
import 'divider.dart';
import 'social_media_auth.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});
  final emailConteoller = TextEditingController();
  final passwordConteoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FeiledCreatedUserState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text(state.massage)));
        }else if(state is UserSignSuccessState){
              GoRouter.of(context).pushReplacement(
              AppRouter.homeView);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 104, left: 24, right: 24),
          child: ListView(
            children: [
              const HeaderBodyText(
                textHeader: 'Sign In',
                textBody: 'Hi Welcome back',
              ),
              SizedBox(
                height: heightMedia * 0.07,
              ),
              CustomTextFieldSign(
                  controller: emailConteoller,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              CustomTextFieldSign(
                controller: passwordConteoller,
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: heightMedia * 0.01,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.forgotPassword,
                        );
                      },
                      child: const Text('Forgot Password?'))),
              CustomSignButton(
                textButton: 'Sign In',
                heightButton: heightMedia * 0.07,
                widthButton: widthMedia * 0.9,
                onPressed: () {
                  if (emailConteoller.text.isNotEmpty &&
                      passwordConteoller.text.isNotEmpty) {
                    BlocProvider.of<AuthCubit>(context).signIn(
                        email: emailConteoller.text,
                        password: passwordConteoller.text);
                  } else {
                    if (emailConteoller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: errorColor,
                          content: Text('Check Email Field Is Empty')));
                    } else if (passwordConteoller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: errorColor,
                          content: Text('Check Password Field Is Empty')));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: errorColor,
                          content: Text('Check Password And Email Field Is Empty')));
                    }
                  }
                },
              ),
              const DividerWidget(
                textDivider: 'Or Sign In With',
              ),
              Row(
                children: [
                  SocialAuthButton(
                    socialAuthIcon: 'assets/image/google.png',
                    heightButton: heightMedia * 0.07,
                    widthButton: widthMedia * 0.85,
                    textButton: 'Sign With Google',
                    onPressed: () {
                       BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                    },
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyles.textStyle14,
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.signUp,
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyles.textStyle14.copyWith(
                        color: appColor,
                      ),
                    ))
              ]),
            ],
          ),
        );
      },
    );
  }
}