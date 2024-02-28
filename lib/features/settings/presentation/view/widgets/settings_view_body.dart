import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/list_all_setting.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/profile_info.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;
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
            SizedBox(height:mediaHeight *0.025,),
            const ProfileInformation(),
            SizedBox(height: mediaHeight * 0.025),           
            GestureDetector(
              onTap: (){},
              child: const ListAllSetting(indexList: 0,)),
            GestureDetector(
                onTap: (){},
                child: const ListAllSetting(indexList: 1),),
            const Row(
              children: [
                ListAllSetting(indexList: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}