import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/sura_details/radio_services.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/Models/radio_model.dart';
import 'package:islamy_app/core/helper/api_services.dart';
import 'package:just_audio/just_audio.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  RadioModel? radioModel;
  bool isLoading = true;
  bool hasError = false;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    loadRadioData();
  }

  @override
  void dispose() {
    player.stop(); // Stop audio when leaving the tab
    player.dispose();
    super.dispose();
  }

  Future<void> loadRadioData() async {
    try {
      radioModel = await RadioServices().getRadio();
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Text(
          radioModel?.name ?? "إذاعة القرآن الكريم",
          style: const TextStyle(color: Colors.amberAccent, fontSize: 30),
        ),
        Image.asset(AppAssets.radioImage),
        Text(
          'إذاعة مشاري العفاسي',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (isLoading) const CircularProgressIndicator(),
        if (hasError)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "تحقق من اتصالك بالإنترنت",
              style: TextStyle(color: AppColors.primaryLightMode),
            ),
          ),
        if (!isLoading && !hasError && radioModel?.url != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Iconplay(url: radioModel!.url, player: player),
            ],
          ),
        const Spacer(),
      ],
    );
  }
}

class Iconplay extends StatefulWidget {
  const Iconplay({this.url, this.player, super.key});
  final String? url;
  final AudioPlayer? player;

  @override
  State<Iconplay> createState() => _IconplayState();
}

class _IconplayState extends State<Iconplay> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.player?.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state.playing;
        });
      }
    });
  }

  Future<void> handlePlayPause() async {
    if (widget.url == null || widget.url!.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "لا يوجد اتصال بالإنترنت",
            style: TextStyle(color: AppColors.primaryLightMode),
          ),
        ),
      );
      return;
    }

    try {
      if (isPlaying) {
        await widget.player?.stop();
      } else {
        await widget.player?.setUrl(widget.url!);
        await widget.player?.play();
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "حدث خطأ أثناء تشغيل الصوت",
            style: TextStyle(color: AppColors.primaryLightMode),
          ),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: handlePlayPause,
      icon: Icon(
        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
        size: 80,
        color: Colors.amberAccent,
      ),
    );
  }
}
