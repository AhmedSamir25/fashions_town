import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AddAdressPhoneTextField extends StatelessWidget {
  const AddAdressPhoneTextField({super.key, required this.onFieldSubmitted,
   required this.controller,required this.keyboardType,  });
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
   final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      controller: controller,
      //onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
       decoration: InputDecoration(
        label: const Text('Enter your adress'),   
        labelStyle: const TextStyle(),     
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