import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_text_field_sign.dart';
import 'divider.dart';
import 'social_media_auth.dart';



class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
     double widthMedia = MediaQuery.of(context).size.width;   
    return  Padding(
      padding:const  EdgeInsets.only(top:104,left: 24,right: 24),
      child:  ListView(
        children: [
          const HeaderBodyText(
            textHeader: 'Sign In',
            textBody: 'Hi Welcome back',
          ),
         SizedBox(height: heightMedia * 0.07,),
         const CustomTextFieldSign(labelText: 'Email',keyboardType: TextInputType.emailAddress),
         SizedBox(height: heightMedia * 0.02,),
          const CustomTextFieldSign(labelText: 'Password',keyboardType: TextInputType.visiblePassword,),
          SizedBox(height: heightMedia * 0.01,),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(onPressed: (){
                GoRouter.of(context).push(
                  AppRouter.forgotPassword,
                );
            }, child: const Text('Forgot Password?'))),
            CustomSignButton(
              textButton: 'Sign In',
              heightButton: heightMedia*0.07,
              widthButton: widthMedia*0.9,
              onPressed: (){},
              ),
            const DividerWidget(textDivider: 'Or Sign In With',),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialAuthButton(socialAuthIcon:'assets/image/google.png' ,heightButton: heightMedia*0.07, widthButton: widthMedia*0.2,),
                SocialAuthButton(socialAuthIcon:'assets/image/facebook.png' ,heightButton: heightMedia*0.07, widthButton: widthMedia*0.2,),
              ],
            ),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Don’t have an account?',style: TextStyles.textStyle14,),
                TextButton(onPressed: (){
                    GoRouter.of(context).push(
                  AppRouter.signUp,
                );
                }, child:  Text('Sign Up',style: TextStyles.textStyle14.copyWith(
                  color: appColor,
                ),))
              ] 
            ),
        
        ],
      ),
    );
  }
}