import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Home/homepage.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
class Splash extends StatelessWidget {
  static const String routeName='splash';
  const Splash({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, HomePage.routeName);

    });

    return Scaffold(
   body: Image.asset(AppAsesets.splash,fit: BoxFit.cover,width: double.infinity,),
    );
  }
}