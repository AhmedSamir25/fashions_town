import 'package:flutter/material.dart';

class SwitchDarkOrLight extends StatefulWidget {
  const SwitchDarkOrLight({super.key,});
  @override
  State<SwitchDarkOrLight> createState() => _SwitchDarkOrLightState();
}

class _SwitchDarkOrLightState extends State<SwitchDarkOrLight> {
   bool light = true;
  @override
  Widget build(BuildContext context) {
    return   Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          print(value);
          light = value;
        });
      },
    );
  }
}