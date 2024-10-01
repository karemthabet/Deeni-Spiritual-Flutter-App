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
                  style: const TextStyle(color:Colors.amberAccent,fontSize: 30),
                ),
                Image.asset(AppAssets.radioImage),
                Text(
                  'إذاعة القرآن الكريم',
                  style: Theme.of(context).textTheme.titleMedium
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                              color: Theme.of(context).colorScheme.error,

                          size: 40,
                          Icons.fast_rewind,
                        ),
                      ),
                    ),
                    Iconplay(url: snap.data!.url),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          size: 40,
                          Icons.fast_forward,
                              color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("تأكد من اتصالك بالانترنت"));
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
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    player.setUrl(widget.url);
    super.initState();
  }

  @override
  void dispose() {
        player.stop();

    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
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
          isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
