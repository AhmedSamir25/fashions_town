import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/settings/data/model/settings_data_list.dart';
import 'package:flutter/material.dart';

class ListAllSetting extends StatelessWidget {
  const ListAllSetting({super.key, required this.indexList});
final int indexList;
  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Row(
          children: [
            Image.asset(SettingsDataList.settingsList[indexList].image,
            width:mediaWidth*0.14 ,height: mediaHeight*0.046,),
            SizedBox(width: mediaWidth *0.055,),
            Text(SettingsDataList.settingsList[indexList].name,
            style: TextStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w500
            ),
            ),
          ],
      ),
    );
  }
}