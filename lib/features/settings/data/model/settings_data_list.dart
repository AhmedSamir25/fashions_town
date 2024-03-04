
import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/features/settings/data/model/settings_model.dart';

class SettingsDataList {
 static List<SettingsModel> settingsList= [
  SettingsModel(
  id: '1',
  name: 'adress',
  image: AssetsManager.adress),

  SettingsModel(id: '2',
   image: AssetsManager.phone,
    name: 'phone'),
  SettingsModel(
  id: '3',
  name: 'order',
  image: AssetsManager.order),
  SettingsModel(id: '4',
   image: AssetsManager.favorite,
    name: 'Favorite'),
SettingsModel(
  id: '5',
  name: 'darkMode',
  image: AssetsManager.darkMode),
 ];
}