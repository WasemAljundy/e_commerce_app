import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys{
  loggedIn, email, language, darkTheme
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
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKeys.email.toString(), email);
  }

  bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  Future<bool> removeKey(String key) async {
    return await _sharedPreferences.remove(key);
  }

  Future<bool> logout() async {
    await removeKey(PrefKeys.email.toString());
    return await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), false);
  }

  Future<bool> changeLanguage({required String lang}) async {
    return await _sharedPreferences.setString(PrefKeys.language.toString(), lang);
  }

  String get language => _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'en';

  Future<bool> changeTheme({required bool darkTheme}) async {
    return await _sharedPreferences.setBool(PrefKeys.darkTheme.toString(), darkTheme);
  }

  bool get darkTheme => _sharedPreferences.getBool(PrefKeys.darkTheme.toString()) ?? false;

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

}