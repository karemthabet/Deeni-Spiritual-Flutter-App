import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/hadeth_datails.dart/hadeth_details.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/styles.dart';

class Hadeth extends StatelessWidget {
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(AppAssets.hadethLogo),
        const Divider(
          color: AppColors.primary,
          thickness: 3,
        ),
        Text(
          'الأحاديث',
          style: AppStyles.regulerAccent,
        ),
        const Divider(
          color: AppColors.primary,
          thickness: 3,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,
                          arguments: HadithModel(index: "h${index + 1}.txt"));
                    },
                    child: Text(
                        style: AppStyles.regulerAccent,
                        textAlign: TextAlign.center,
                        'الحديث رقم ${index + 1}'),
                  );
                }))
      ],
    );
  }
}

class HadithModel {
  String index;
  HadithModel({required this.index});
}
