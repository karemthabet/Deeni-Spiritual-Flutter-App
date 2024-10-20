import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/Home/homepage.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';

class Splash extends StatelessWidget {
  static const String routeName = 'splash';
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? AppAssets.logo2
                        : AppAssets.logo)),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'Supervised by Kareem Thabet',
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        ));
  }
}
