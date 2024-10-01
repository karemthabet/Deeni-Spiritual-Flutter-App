import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Tabs/hadeth.dart';
import 'package:islamy_app/Ui/Screens/Tabs/quran.dart';
import 'package:islamy_app/Ui/Screens/Tabs/radio.dart';
import 'package:islamy_app/Ui/Screens/Tabs/sebha.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';

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
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroudMethod(context),
      ),
      child: Scaffold(
        appBar:  AppBar(
    backgroundColor: AppColors.transparent,
    centerTitle: true,
    title: Text(
      'إسلامي',
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
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.quran)), label: "القرآن"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.sebhaTab)), label: "التسبيح"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.radio)), label: "الراديو"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.hadeth)), label: "الأحاديث"),
      ],
    );
  }
}
