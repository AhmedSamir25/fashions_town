import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldSign extends StatelessWidget {
  const CustomTextFieldSign({super.key, required this.labelText, required this.keyboardType, this.controller,});
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  
  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: appColor,
      controller: controller,
     
      decoration: InputDecoration(
        label: Text(labelText),   
        labelStyle:const TextStyle(color: textColor),     
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: const OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: appColor,),
        )
      ),
      keyboardType: keyboardType,
    );
  }
}