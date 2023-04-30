import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/prefs/shared_pref_controller.dart';
import 'package:ui_app/provider/app_provider.dart';
import 'package:ui_app/screens/drawer_screens/faqs/faqs_screen.dart';
import 'package:ui_app/screens/drawer_screens/info/info_screen.dart';
import 'package:ui_app/screens/launch_screen.dart';
import 'package:ui_app/screens/login_screen.dart';
import 'package:ui_app/screens/main_screen.dart';
import 'package:ui_app/screens/out_boarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),

      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  MyMaterialApp({Key? key}) : super(key: key);

  // bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      theme: Provider.of<LanguageProvider>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/out_boarding_screen': (context) => const OutBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/faqs_screen': (context) => const FaqsScreen(),
        '/info_screen': (context) => const InfoScreen(),
      },
    );
  }
}
