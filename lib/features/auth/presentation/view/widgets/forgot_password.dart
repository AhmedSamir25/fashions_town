import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_text_field_sign.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 120),
        child: Column(
          children: [
            const HeaderBodyText(textHeader: 'Enter your email', textBody: 'We will send you a mail \n containing 6 numbers'),
            SizedBox(height: heightMedia*0.03,),
            const CustomTextFieldSign(
              labelText: 'Email', keyboardType: TextInputType.emailAddress),
            SizedBox(height: heightMedia*0.03,),
            CustomSignButton(
              heightButton: heightMedia * 0.07,
              widthButton: widthMedia * 0.9,
              textButton: 'Send code',
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}