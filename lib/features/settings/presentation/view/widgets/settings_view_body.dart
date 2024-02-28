import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/profile_info.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  Padding(
        padding:const EdgeInsets.only(top: 70,left: 16,right: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Settings',style: TextStyles.textStyle20.copyWith(
                color: Colors.black
              ),)),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            const ProfileInformation(),
          ],
        ),
      ),
    );
  }
}