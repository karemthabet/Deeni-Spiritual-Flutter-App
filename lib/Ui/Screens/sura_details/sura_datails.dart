import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/Ui/Models/SuraDetails.dart';
import 'package:islamy_app/Ui/Screens/sura_details/listen_services.dart';
import 'package:islamy_app/Ui/Widgets/build_app_bar.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:just_audio/just_audio.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  const SuraDetails({super.key});
  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late AudioPlayer player;
  String suraContent = "";
  bool isLoad = false;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    SuraDetailsModel suraDetailsContent =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsModel;
    readFileContent(suraDetailsContent.filename);
    return Container(
      decoration: BoxDecoration(
        image: backgroudMethod(context),
      ),
      child: Scaffold(
        appBar: buildAppBar(context: context),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${suraDetailsContent.suraName}",
                    style: Theme.of(context).textTheme.titleLarge!,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    color: Theme.of(context).textTheme.titleLarge!.color,
                    onPressed: () async {
                      if (!player.playing) {
                        isLoad = true;
                        setState(() {});
                        Sura sura = await ListenServices()
                            .getSura(suraNumber: suraDetailsContent.numSura);

                        if (sura.suraUrl == '') {
                          showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                    title: Text('Check your internet'));
                              });
                          isLoad = false;
                        } else {
                          await player.setUrl(sura.suraUrl);

                          isLoad = false;
                          setState(() {});
                          player.play();
                        }
                      } else {
                        player.pause();
                      }
                    },
                    icon: isLoad
                        ? Theme.of(context).brightness == Brightness.light
                            ? const CircularProgressIndicator(
                                color: AppColors.primaryLightMode,
                              )
                            : const CircularProgressIndicator(
                                color: AppColors.goldDarkMode,
                              )
                        : Icon(
                            player.playing ? Icons.pause : Icons.play_circle,
                            size: 35,
                          ),
                  ),
                ],
              ),
              const Divider(
                endIndent: 60,
                indent: 60,
                thickness: 1,
                color: AppColors.primaryLightMode,
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      suraContent.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: _buildSuraContent(suraContent),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSuraContent(String suraContent) {
    List<String> verses = suraContent.split("\n");
    return verses.map((verse) {
      int verseIndex = verses.indexOf(verse) + 1;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.brightness == Brightness.light
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                : Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الآية $verseIndex",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                verse,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void readFileContent(String filename) async {
    String content = await rootBundle.loadString("assets/files/$filename");
    setState(() {
      suraContent = content;
    });
  }
}

DecorationImage backgroudMethod(context) {
  return DecorationImage(
    image: AssetImage(
        Theme.of(context).colorScheme.brightness == Brightness.light
            ? AppAssets.defultBackground
            : AppAssets.defultDarkBackground),
    fit: BoxFit.cover,
  );
}
