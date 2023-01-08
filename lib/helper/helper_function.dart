import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
// keys
  static var userLoggedInKey = 'LOGGEDINKEY';
  static var userNameKey = 'USERNAMEKEY';
  static var userEmailKey = 'USEREMAILKEY';

// saving the data to shared preferences

// getting the data from shared preferences

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
}
