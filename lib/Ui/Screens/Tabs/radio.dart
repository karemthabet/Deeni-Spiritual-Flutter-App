import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:just_audio/just_audio.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  String? radioName;
  String? radioUrl;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    loadRadioData();
  }

  Future<void> loadRadioData() async {
    try {
      final radioData = await Future.delayed(const Duration(seconds: 2), () {
        return {
          "name": "إذاعة القرآن الكريم",
          "url": "https://example.com/stream.mp3"
        };
      });

      if (!mounted) return; // تجنب تحديث الواجهة إذا تم إغلاق الصفحة

      setState(() {
        radioName = radioData["name"];
        radioUrl = radioData["url"];
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
          radioName ?? "إذاعة القرآن الكريم",
          style: const TextStyle(color: Colors.amberAccent, fontSize: 30),
        ),
        Image.asset(AppAssets.radioImage),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Iconplay(url: radioUrl),
          ],
        ),
        const Spacer(),
        if (isLoading) const CircularProgressIndicator(),
        if (hasError)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "تحقق من اتصالك بالإنترنت",
              style: TextStyle(color: AppColors.primaryLightMode),
            ),
          ),
      ],
    );
  }
}

class Iconplay extends StatefulWidget {
  const Iconplay({this.url, super.key});
  final String? url;

  @override
  State<Iconplay> createState() => _IconplayState();
}

class _IconplayState extends State<Iconplay> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state.playing;
        });
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void handlePlayPause() async {
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
      setState(() {
        isLoading = true;
      });

      if (isPlaying) {
        await player.stop();
      } else {
        await player.setUrl(widget.url!);
        await player.play();
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
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isLoading ? null : handlePlayPause,
      icon: isLoading
          ? const CircularProgressIndicator()
          : Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              size: 80,
              color: Colors.amberAccent,
            ),
    );
  }
}
