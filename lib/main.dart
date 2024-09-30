import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Home/homepage.dart';
import 'package:islamy_app/Ui/Screens/Splash/splash.dart';
import 'package:islamy_app/Ui/Screens/hadeth_datails.dart/hadeth_details.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';

void main(){
  runApp(const IslamyApp());
}
class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
debugShowCheckedModeBanner: false,
routes: {
  Splash.routeName:(context)=>const Splash(),
  HomePage.routeName:(context)=>const HomePage(),
  SuraDetails.routeName:(context)=>const SuraDetails(),
  HadethDetails.routeName:(context)=>const HadethDetails(),
},
initialRoute:Splash.routeName,
    );
  }
}