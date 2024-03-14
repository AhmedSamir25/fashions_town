import 'package:shared_preferences/shared_preferences.dart';
class SaveThemeMode {

static late SharedPreferences prefs;

  static Future cacheInitialization()async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setTheme( {required bool themeDarkOrLight})async{
    
      await prefs.setBool('themeDarkOrLight', themeDarkOrLight);
 }  
    bool getTheme(){
     var themevalue = prefs.getBool('themeDarkOrLight');
     if (prefs.getBool('themeDarkOrLight') == null) {
       themevalue = false;
     }else{
      themevalue = prefs.getBool('themeDarkOrLight');
     }
     return themevalue!;
  } 
}
