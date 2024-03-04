import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AddAdressTextField extends StatelessWidget {
  const AddAdressTextField({super.key, required this.onFieldSubmitted, required this.controller,  });
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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