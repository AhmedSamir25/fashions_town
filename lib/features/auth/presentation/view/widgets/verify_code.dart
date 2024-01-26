import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fashionstown/features/auth/presentation/view/widgets/header_body_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'custom_text_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children:[ Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 120),
          child: Column(
            children: [
              const HeaderBodyText(
                  textHeader: 'Verify Code',
                  textBody: 'Please enter the code we just send to email'),
              SizedBox(height: heightMedia*0.03,),
              PinCodeTextField(
                appContext: context,
                length: 6,
                autoFocus: true,
                cursorColor: appColor,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  inactiveColor: Colors.grey,
                  selectedColor: appColor,
                  activeColor: Colors.green,
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: heightMedia*0.02,),
              const CustomTextButton(
                  text: 'Didn’t receive OTP?', textButton: 'Resend code'),
              SizedBox(height: heightMedia*0.02,),
              CustomSignButton(
                heightButton: heightMedia * 0.07,
                widthButton: widthMedia * 0.9,
                textButton: 'Verify',
              )
            ],
          ),
        ),],
      ),
    );
  }
}