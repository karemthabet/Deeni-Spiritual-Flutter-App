import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Tabs/hadeth.dart';
import 'package:islamy_app/Ui/Screens/Tabs/quran.dart';
import 'package:islamy_app/Ui/Screens/Tabs/radio.dart';
import 'package:islamy_app/Ui/Screens/Tabs/sebha.dart';
import 'package:islamy_app/Ui/Screens/Tabs/settings.dart';
import 'package:islamy_app/Ui/Widgets/build_app_bar.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>tabs=[const Quran(),const Sebha(),const RadioTab(),const Hadeth(),const SettingsTab()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.defultBackground), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildButtonNavigationBar(),
        body:tabs[currentIndex] ,
      ),
    );
  }

  Widget buildButtonNavigationBar() {
    return Theme(
      data: ThemeData(
        canvasColor: AppColors.primary,
      ),
      child: BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedFontSize: 23,
        selectedItemColor: AppColors.black,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.quran)), label: "القرآن"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.sebha)), label: "التسبيح"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.radio)), label: "الراديو"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.hadeth)), label: "الأحاديث"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "الإعدادات"),
        ],
      ),
    );
  }
}
