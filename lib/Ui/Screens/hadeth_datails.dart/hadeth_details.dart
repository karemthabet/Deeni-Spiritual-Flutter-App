import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/Ui/Screens/Tabs/hadeth.dart';
import 'package:islamy_app/Ui/Screens/sura_details/sura_datails.dart';
import 'package:islamy_app/Ui/Widgets/build_app_bar.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});
  static const String routeName = "hadeth";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String hadethContent = "جاري تحميل الحديث...";
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
    readFileHadethContent(hadithModel.index);

    return Container(
      decoration: BoxDecoration(
        image: backgroudMethod(context),
      ),
      child: Scaffold(appBar: buildAppBar(context: context),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.onPrimary,
        
          ),
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                      isError ? "حدث خطأ أثناء تحميل الحديث." : hadethContent,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleSmall,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void readFileHadethContent(String filename) async {
    try {
      String content =
          await rootBundle.loadString("assets/quran/ahadeth/$filename");
      setState(() {
        hadethContent = content;
      });
    } catch (e) {
      setState(() {
        isError = true;
      });
    }
  }
}
