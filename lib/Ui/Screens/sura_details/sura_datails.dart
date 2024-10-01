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
      decoration:  BoxDecoration(
        image: backgroudMethod(context),

      ),
      child:  
        Scaffold(appBar:buildAppBar(context: context),
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
                     style:  Theme.of(context).textTheme.titleLarge!,
          
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                     color:  Theme.of(context).textTheme.titleLarge!.color,
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
                          ? const CircularProgressIndicator()
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
                  child: ListView(children: [
                    suraContent.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              formatSuraContent(suraContent),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                        ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      
    );
  }

  

  void readFileContent(String filename) async {
    String content = await rootBundle.loadString("assets/files/$filename");
    setState(() {
      suraContent = content;
    });
  }

  String formatSuraContent(String suraContent) {
    List<String> verses = suraContent.split("\n");
    String formattedContent = "";
    for (int i = 0; i < verses.length; i++) {
      formattedContent += "${verses[i]}(${i + 1})";
    }
    return formattedContent.trim();
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