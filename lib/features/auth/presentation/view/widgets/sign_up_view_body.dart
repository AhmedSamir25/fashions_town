import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'divider.dart';
import 'social_media_auth.dart';



class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
     double widthMedia = MediaQuery.of(context).size.width;   
    return  Padding(
      padding:const  EdgeInsets.only(top:80,left: 24,right: 24),
      child:  ListView(
        children: [
          const HeaderBodyText(
            textHeader: 'Creaye Account',
            textBody: 'Hi fill your information below or register\n           with your social account.',
          ),
         SizedBox(height: heightMedia * 0.06,),
          const CustomTextField(labelText: 'Name',keyboardType: TextInputType.text),
         SizedBox(height: heightMedia * 0.02,),
         const CustomTextField(labelText: 'Email',keyboardType: TextInputType.emailAddress),
         SizedBox(height: heightMedia * 0.02,),
          const CustomTextField(labelText: 'Password',keyboardType: TextInputType.visiblePassword,),
          SizedBox(height: heightMedia * 0.02,),
         
            CustomSignButton(textButton: 'Sign Up',heightButton: heightMedia*0.07, widthButton: widthMedia*0.9,),
            const DividerWidget(textDivider: 'Or Sign Up With',),
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
                Text('Already have an acount?',style: TextStyles.textStyle14,),
                TextButton(onPressed: (){}, child: Text('Sign In',style: TextStyles.textStyle14.copyWith(
                  color: appColor,),
                  ),
                  ),
              ] 
            ),
        ],
      ),
    );
  }
}