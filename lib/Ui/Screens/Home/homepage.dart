import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Tabs/hadeth.dart';
import 'package:islamy_app/Ui/Screens/Tabs/quran.dart';
import 'package:islamy_app/Ui/Screens/Tabs/radio.dart';
import 'package:islamy_app/Ui/Screens/Tabs/sebha.dart';
import 'package:islamy_app/Ui/Screens/Tabs/settings.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/applocalization.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tabs = [
    const Quran(),
    const Sebha(),
    const RadioTab(),
    const Hadeth(),
    const SettingsTab(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroudMethod(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
             appLocalizations(context).islamyKey,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        bottomNavigationBar: buildButtonNavigationBar(),
        body: tabs[currentIndex],
      ),
    );
  }

  Widget buildButtonNavigationBar() {
    return BottomNavigationBar(
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
      selectedFontSize: 23,
      items: [
        BottomNavigationBarItem(
          icon: const ImageIcon(AssetImage(AppAssets.quran)),
          label:  appLocalizations(context).quranKey,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(AssetImage(AppAssets.sebhaTab)),
          label:  appLocalizations(context).sebhaKey,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(AssetImage(AppAssets.radio)),
          label:  appLocalizations(context).radioKey,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(AssetImage(AppAssets.hadeth)),
          label:  appLocalizations(context).hadethKey,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label:  appLocalizations(context).settingsKey,
        ),
      ],
    );
  }
}
