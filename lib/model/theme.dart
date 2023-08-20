import '../constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loadTheme(bool light,String changeTheme, SharedPreferences sharedPreferences) {
  light = sharedPreferences.getBool("theme")!;
  setTheme(light, changeTheme, sharedPreferences);
}

void saveTheme(bool light,String changeTheme, SharedPreferences sharedPreferences) {
  sharedPreferences.setBool("theme", light);
  setTheme(light, changeTheme, sharedPreferences);
}

void setTheme(bool light,String changeTheme, SharedPreferences sharedPreferences) {
  if (light) {
    changeTheme = "Dark";
    titleBGColor = lightV;
    appBGColor = beige;
    componentsColor = lighterV;
    textColor = black;
    hintColor = white;
  } else {
    changeTheme = "Light";
    titleBGColor = blue;
    appBGColor = black;
    componentsColor = white;
    textColor = black;
    hintColor = grey;
  }
}
