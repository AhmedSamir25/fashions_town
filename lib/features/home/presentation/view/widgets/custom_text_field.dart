import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: appColor,
      decoration: InputDecoration(
        label:const Text('Search'),   
        labelStyle:const TextStyle(color: textColor),     
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: const OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: appColor,),
        )
      ),
    );
  }
}