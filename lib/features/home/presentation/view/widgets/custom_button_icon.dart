import 'package:flutter/material.dart';

class CusttomIconButton extends StatelessWidget {
  const CusttomIconButton({super.key, required this.onPressed, required this.icon});
  final  Function() onPressed;
  final  Widget icon;
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: onPressed , icon:icon );
  }
}