import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  setUser(bool status) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool('USER', status);
  }

  getUser() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool? userStatus = instance.getBool('USER');
   // if (userStatus == null) {
   //   return false;
   // } else {
   //   return userStatus;
   // }
    return userStatus ?? false; // true, false, null
  }
}
