import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:sarafi_zaitoon/Components/colors.dart';
import 'package:sarafi_zaitoon/Provider/ui_provider.dart';
import 'package:sarafi_zaitoon/Views/Onboarding/select_language.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Locales.init(['en', 'fa','ps']);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return LocaleBuilder(
            builder: (locale) => MaterialApp(
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              debugShowCheckedModeBanner: false,
              title: 'Sarafi',
              theme: ThemeData(
                primaryColor: primaryColor,
                fontFamily: locale.toString() == "en"?"Ubuntu":"Dubai",
                useMaterial3: true,
              ),
              home: const SelectLanguage(),
            )
          );
        }
      ),
    );
  }
}

