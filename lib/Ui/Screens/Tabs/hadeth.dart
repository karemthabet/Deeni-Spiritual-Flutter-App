import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/hadeth_datails.dart/hadeth_details.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';

class Hadeth extends StatelessWidget {
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(AppAssets.hadethLogo),
        const Divider(
          thickness: 3,
        ),
        Text('الأحاديث', style: Theme.of(context).textTheme.titleMedium),
        const Divider(
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
                        style: Theme.of(context).textTheme.titleMedium,
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
