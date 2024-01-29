import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../manager/auth_cubit/auth_state.dart';
import 'custom_text_field_sign.dart';
import 'divider.dart';
import 'social_media_auth.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final emaillConteoller = TextEditingController();
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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text(emaillConteoller.toString())));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
          child: ListView(
            children: [
              const HeaderBodyText(
                textHeader: 'Creaye Account',
                textBody:
                    'Hi fill your information below or register\n           with your social account.',
              ),
              SizedBox(
                height: heightMedia * 0.06,
              ),
              const CustomTextFieldSign(
                  labelText: 'Name', keyboardType: TextInputType.text),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              CustomTextFieldSign(
                  controller: emaillConteoller,
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
                height: heightMedia * 0.02,
              ),
              CustomSignButton(
                textButton: 'Sign Up',
                heightButton: heightMedia * 0.07,
                widthButton: widthMedia * 0.9,
                onPressed: () {
                  if (emaillConteoller.text.isNotEmpty &&
                      passwordConteoller.text.isNotEmpty) {
                    BlocProvider.of<AuthCubit>(context).registerWithEmail(
                        email: emaillConteoller.text,
                        password: passwordConteoller.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: errorColor,
                        content: Text('Email And Password Is Empty')));
                  }
                },
              ),
              const DividerWidget(
                textDivider: 'Or Sign Up With',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialAuthButton(
                    socialAuthIcon: 'assets/image/google.png',
                    heightButton: heightMedia * 0.07,
                    widthButton: widthMedia * 0.2,
                    onPressed: (){
                       BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                    },
                  ),
                  SocialAuthButton(
                    socialAuthIcon: 'assets/image/facebook.png',
                    heightButton: heightMedia * 0.07,
                    widthButton: widthMedia * 0.2,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already have an acount?',
                  style: TextStyles.textStyle14,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.signIn,
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyles.textStyle14.copyWith(
                      color: appColor,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}