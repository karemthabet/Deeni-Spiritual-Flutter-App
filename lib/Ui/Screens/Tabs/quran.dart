import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Models/SuraDetails.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/app_constants.dart';

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
        buildContent(context),
      ],
    );
  }

  Widget buildDevider(context) {
    return  Divider(
      height: 2,
      
            color:Theme.of(context).colorScheme.error,
    );
  }

  Widget buildRowScreen(context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'عدد الآيات ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 28,fontWeight: FontWeight.bold),

            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: Text(
          ' اسم السورة',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 28,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  Widget buildContent(context) {
    return Expanded(
      flex: 6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              buildDevider(context),
              buildRowScreen(context),
              buildDevider(context),
              buildSures(),
            ],
          ),
          const  VerticalDivider(
            color:AppColors.primaryLightMode,
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
                color: AppColors.primaryLightMode,
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
          style: Theme.of(context).textTheme.titleMedium!,
                    )),
                    Expanded(
                        child: Text(
                      textAlign: TextAlign.center,
                      AppConstants.suraNames[index],
          style: Theme.of(context).textTheme.titleMedium!,
                    )),
                  ],
                ),
              );
            }));
  }
}
