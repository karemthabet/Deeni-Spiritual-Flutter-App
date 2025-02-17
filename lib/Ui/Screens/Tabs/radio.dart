import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/Screens/sura_details/radio_services.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:just_audio/just_audio.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RadioServices().getRadio(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  snap.data!.name,
                  style:
                      const TextStyle(color: Colors.amberAccent, fontSize: 30),
                ),
                Image.asset(AppAssets.radioImage),
                Text('إذاعة القرآن الكريم',
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Iconplay(url: snap.data!.url),
                  ],
                ),
                const Spacer(),
              ],
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("تأكد من اتصالك بالانترنت",style:TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold) ,));
          }
        });
  }
}

class Iconplay extends StatefulWidget {
  const Iconplay({
    required this.url,
    super.key,
  });
  final String url;

  @override
  State<Iconplay> createState() => _IconplayState();
}

class _IconplayState extends State<Iconplay> {
  static final AudioPlayer player = AudioPlayer(); // Singleton Instance
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (!isPlaying) {
      player.setUrl(widget.url);
    }
  }

  @override
  void dispose() {
    if (isPlaying) {
      player.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        key: ValueKey<bool>(isPlaying),
        onPressed: () {
          if (isPlaying) {
            player.stop();
            isPlaying = false;
          } else {
            player.play();
            isPlaying = true;
          }
          setState(() {});
        },
        icon: Icon(

          size: 80,
          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
