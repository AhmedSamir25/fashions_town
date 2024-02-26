import 'package:flutter/material.dart';

class CusttomIconButton extends StatelessWidget {
  const CusttomIconButton({super.key, 
  required this.onPressed,
   required this.icon, 
   required this.colorIcon,
   });
  final  Function() onPressed;
  final  Widget icon;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: onPressed , icon:icon ,color:colorIcon,iconSize: 27,);
  }
}