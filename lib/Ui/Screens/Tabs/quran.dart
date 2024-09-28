import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Models/SuraDetails.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/app_constants.dart';
import 'package:islamy_app/Ui/utils/styles.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.qur2anScreenlogo)),
        const SizedBox(
          height: 3,
        ),
        buildContent(),
      ],
    );
  }

  Widget buildDevider() {
    return const Divider(
      height: 2,
      thickness: 2,
      color: AppColors.primary,
    );
  }

  Widget buildRowScreen() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'عدد الآيات ',
            style: AppStyles.semiBoldAccent,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: Text(
          ' اسم السورة',
          style: AppStyles.semiBoldAccent,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  Widget buildContent() {
    return Expanded(
      flex: 6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              buildDevider(),
              buildRowScreen(),
              buildDevider(),
              buildSures(),
            ],
          ),
          const VerticalDivider(
            thickness: 2,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget buildSures() {
    return Expanded(
        child: ListView.separated(
            itemCount: AppConstants.suraNames.length,
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.primary,
              );
            },
            itemBuilder: (context, index) {  
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName, 
                      arguments: SuraDetailsModel(
                        numSura: index,
                        filename: "${index + 1}.txt",
                        suraName: AppConstants.suraNames[index],
                      ));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      textAlign: TextAlign.center,
                      AppConstants.versesNumber[index].toString(),
                      style: AppStyles.regulerAccent,
                    )),
                    Expanded(
                        child: Text(
                      textAlign: TextAlign.center,
                      AppConstants.suraNames[index],
                      style: AppStyles.regulerAccent,
                    )),
                  ],
                ),
              );
            }));
  }
}
