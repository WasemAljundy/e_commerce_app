
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKey{
  loggedIn, email
}

class SharedPrefController {

  static final SharedPrefController _instance = SharedPrefController._internal();
  late SharedPreferences _sharedPreferences;

  SharedPrefController._internal();

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save ({required String email}) async {
    await _sharedPreferences.setBool(PrefsKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefsKey.email.toString(), email);
  }

  bool get loggedIn => _sharedPreferences.getBool(PrefsKey.loggedIn.toString()) ?? false;

  Future<bool> removeKey(String key) async {
    return await _sharedPreferences.remove(key);
  }

  Future<bool> logout() async {
    await removeKey(PrefsKey.email.toString());
    return await _sharedPreferences.setBool(PrefsKey.loggedIn.toString(), false);
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

}