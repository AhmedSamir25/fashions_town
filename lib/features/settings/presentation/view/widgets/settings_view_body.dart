import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/list_all_setting.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/profile_info.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/sign_out_bottun.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/switch_dark_or_light.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              child: Text('Settings',style: TextStyles.textStyle20)),
            SizedBox(height:mediaHeight *0.025,),
            const ProfileInformation(),
            SizedBox(height: mediaHeight * 0.025),           
            // adress
            GestureDetector(
              onTap: (){
                GoRouter.of(context).push(
                  AppRouter.addAdress
                );
              },
              child: const ListAllSetting(indexList: 0,)),
           // phone
            GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(
                    AppRouter.addPhone,
                  );
                },
                child: const ListAllSetting(indexList: 1),),
                // order
                GestureDetector(
                  onTap: () {
                  },
                  child: const ListAllSetting(indexList: 2),
                ),
                //Favorite
                GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(
                    AppRouter.favoriteView,
                  );
                },
                child: const ListAllSetting(indexList: 3),),
            const Row(
              children: [
                ListAllSetting(indexList: 4),
                Spacer(flex: 3,),
                SwitchDarkOrLight(),
                Spacer(flex: 1,),
              ],
            ),
            SizedBox(
              height: mediaHeight*0.025,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}