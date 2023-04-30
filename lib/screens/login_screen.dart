import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ui_app/provider/app_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.login,
          style: TextStyle(
            color: Provider.of<LanguageProvider>(context).darkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () => Provider.of<LanguageProvider>(context, listen: false)
            .changeLanguage(),
        child: const Icon(Icons.language),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.enter_email_password,
                  style: TextStyle(
                    color: Provider.of<LanguageProvider>(context).darkTheme
                        ? Colors.white38
                        : Colors.black45,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: AppLocalizations.of(context)!.email,
                    hintText: 'wasem@gmail.com',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.email),
                    errorText: _emailErrorText,
                  ),
                  // errorText: _emailErrorText,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordTextEditingController,
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureText = !_obscureText;
                      }),
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                    errorText: _passwordErrorText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => performLogin(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.login),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SOLID - Single Responsibility
  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      checkError();
      return true;
    } else {
      checkError();
      showMessage(message: 'Enter required fields !', error: true);
      return false;
    }
  }

  void checkError() {
    setState(
      () {
        _emailErrorText = _emailTextEditingController.text.isEmpty
            ? 'Enter email address'
            : null;
        _passwordErrorText = _passwordTextEditingController.text.isEmpty
            ? 'Enter password'
            : null;
      },
    );
  }

  void login() async {
    showMessage(message: 'Logged in Successfully');
    await SharedPrefController().save(email: _emailTextEditingController.text);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  void showMessage({required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
    );
  }
}
