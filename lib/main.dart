import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy_app/Ui/Screens/Home/homepage.dart';
import 'package:islamy_app/Ui/Screens/Splash/splash.dart';
import 'package:islamy_app/Ui/Screens/hadeth_datails.dart/hadeth_details.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/cashe/cash_data.dart';
import 'package:islamy_app/providers/language_provider.dart';
import 'package:islamy_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashData.cacheInitialization(); 

  String savedLanguage = CashData.getData(key: "lang") ?? "en";
  String savedTheme = CashData.getData(key: "theme") ?? "light";
  ThemeMode savedAppTheme = savedTheme == "dark" ? ThemeMode.dark : ThemeMode.light;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(initialAppTheme: savedAppTheme)),
        ChangeNotifierProvider(create: (context) => LanguageProvider(initialLanguage: savedLanguage)),
      ],
      child: const IslamyApp(),
    ),
  );
}



class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale:  Locale(Provider.of<LanguageProvider>(context).selectedLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:Provider.of<ThemeProvider>(context).myAppTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (context) => const Splash(),
        HomePage.routeName: (context) => const HomePage(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
