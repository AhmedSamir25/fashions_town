import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key,r, required this.onChanged  });
final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged,
       decoration: InputDecoration(
        suffixIcon: Icon(Icons.search_rounded,size: 35,),
        label: const Text('Search'),   
        labelStyle: const TextStyle(color: textColor),     
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