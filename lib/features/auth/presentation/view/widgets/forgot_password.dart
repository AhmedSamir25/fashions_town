import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:fashionstown/features/auth/presentation/view/sign_in_view.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_text_field_sign.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});
final emailConteoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FeiledResetPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text(state.massage)));
         } 
         else if (state is SuccessResetPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text('Check your Email',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.only(top: 120,right: 18,left: 18),
            child: ListView(
              children: [
                const HeaderBodyText(
                    textHeader: 'Enter your email',
                    textBody:
                        'check your email will be \nsend password reset link'),
                SizedBox(
                  height: heightMedia * 0.03,
                ),
                CustomTextFieldSign(
                    controller: emailConteoller,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: heightMedia * 0.03,
                ),
                CustomSignButton(
                  heightButton: heightMedia * 0.07,
                  widthButton: widthMedia * 0.9,
                  textButton: 'Send code',
                  onPressed: () {
                     if (emailConteoller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: errorColor,
                          content: Text('Check Email Field Is Empty')));
                     }else{
                      BlocProvider.of<AuthCubit>(context).resetPassword(email: emailConteoller.text);
                     }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}