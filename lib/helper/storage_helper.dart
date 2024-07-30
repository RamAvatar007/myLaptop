import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static final StorageHelper _singleton = StorageHelper._internal();

  factory StorageHelper() {
    return _singleton;
  }

  StorageHelper._internal();

  late SharedPreferences? sp;

  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  void setUserBearerToken(String value) {
    sp?.setString("user_bearer_token", value);
  }

  getUserBearerToken() {
    return sp?.getString("user_bearer_token");
  }

  void clearData() {
    sp?.clear();
  }

  void setUserName(String value) {
    sp?.setString("user_name", value);
  }

  getUserName() {
    return sp?.getString("user_name");
  }

  void setUserEmail(String value) {
    sp?.setString("user_email", value);
  }

  getUserEmail() {
    return sp?.getString("user_email");
  }

  void setUserPhone(String value) {
    sp?.setString("user_phone", value);
  }

  getUserPhone() {
    return sp?.getString("user_phone");
  }

  void setUserPassword(String value) {
    sp?.setString("user_password", value);
  }

  getUserPassword() {
    return sp?.getString("user_password");
  }
}
