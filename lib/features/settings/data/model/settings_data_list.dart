
import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/features/settings/data/model/settings_model.dart';

class SettingsDataList {
 static List<SettingsModel> settingsList= [
  SettingsModel(
  id: '1',
  name: 'adress',
  image: AssetsManager.adress),
  SettingsModel(
  id: '2',
  name: 'order',
  image: AssetsManager.order),
  SettingsModel(
  id: '3',
  name: 'darkMode',
  image: AssetsManager.darkMode),
 ];
}