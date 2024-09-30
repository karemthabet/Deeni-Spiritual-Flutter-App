import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_constants.dart';
import 'package:islamy_app/Ui/utils/styles.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => SebhaState();
}

class SebhaState extends State<Sebha> {
  int numberOfTasbeh = 0;
  int currentTasbehIndex = 0;

  @override
  Widget build(BuildContext context) {
    String text = AppConstants.tasbehList[currentTasbehIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AppAssets.sebha),
            Positioned(
              top: -72,
              child: Image.asset(AppAssets.sebhaicon),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'عدد التسبيحات',
          style: AppStyles.semiBoldAccent,
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 230, 164, 33),
          ),
          onPressed: () {
            setState(() {
              if (numberOfTasbeh < 33) {
                numberOfTasbeh++;
              } else {
                numberOfTasbeh = 0;
                currentTasbehIndex =
                    (currentTasbehIndex + 1) % AppConstants.tasbehList.length;
              }
            });
          },
          child: Text(
            numberOfTasbeh.toString(),
            style: AppStyles.regulerAccent,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primary,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppStyles.semiBoldAccentwhite,
            ),
          ),
        ),
       const  Spacer(),
      ],
    );
  }
}
