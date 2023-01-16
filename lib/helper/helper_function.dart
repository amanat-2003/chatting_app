import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
// keys
  static var userLoggedInKey = 'LOGGEDINKEY';
  static var userNameKey = 'USERNAMEKEY';
  static var userEmailKey = 'USEREMAILKEY';

// saving the data to shared preferences

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<void> saveUser(
      {bool? isUserLoggedIn, String? userName, String? email}) async {
    SharedPreferences sf =await SharedPreferences.getInstance();
    await sf.setBool(userLoggedInKey, isUserLoggedIn!);
    await sf.setString(userNameKey, userName!);
    await sf.setString(userEmailKey, email!);
  }

  static Future<bool> saveUserEmailSF(String email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, email);
  }

// getting the data from shared preferences

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
}
