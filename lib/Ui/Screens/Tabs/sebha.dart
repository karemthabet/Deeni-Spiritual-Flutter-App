import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/app_constants.dart';
import '../../utils/app_assets.dart';
import 'dart:math';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => SebhaState();
}

class SebhaState extends State<Sebha> with SingleTickerProviderStateMixin {
  int numberOfTasbeh = 0;
  int currentTasbehIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementTasbeh() {
    setState(() {
      if (numberOfTasbeh < 33) {
        numberOfTasbeh++;
      } else {
        numberOfTasbeh = 0;
        currentTasbehIndex =
            (currentTasbehIndex + 1) % AppConstants.tasbehList.length;
      }
      _animationController.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    String text = AppConstants.tasbehList[currentTasbehIndex];
    double sebhaRadius = 100;

    double anglePerStep = 2 * pi / 33;

    double currentAngle = anglePerStep * numberOfTasbeh;

    double dx = sebhaRadius * cos(currentAngle);
    double dy = sebhaRadius * sin(currentAngle);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? AppAssets.sebha
                  : AppAssets.bodySebhaDark,
              width: sebhaRadius * 2,
              height: sebhaRadius * 2,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    dx * _animationController.value,
                    dy * _animationController.value,
                  ),
                  child: Image.asset(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? AppAssets.headSebha
                        : AppAssets.bodySebhaDarkLogo,
                    width: 50,
                    height: 50,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 230, 164, 33),
          ),
          onPressed: _incrementTasbeh,
          child: Text(
            numberOfTasbeh.toString(),
            style: const TextStyle(color: AppColors.accent),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.error,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
