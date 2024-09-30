import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Home/homepage.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/styles.dart';

class Splash extends StatelessWidget {
  static const String routeName = 'splash';
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });

    return Scaffold(
       // backgroundColor: const Color(0xfff5f4f4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(AppAssets.splash)),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'Supervised by Kareem Thabet',
                style: AppStyles.splash,
              ),
            ),
          ],
        ));
  }
}
