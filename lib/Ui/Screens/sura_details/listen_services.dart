import 'package:islamy_app/core/helper/api_services.dart';

class ListenServices {
  Future<Sura> getSura({required int suraNumber}) async {
    final jsonData = await ApiServices().getMethod(
      apiUrl:
          'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/quran/ar/ar/1/25/json',
    );

    try {
      final Sura sura = Sura(
        suraUrl: jsonData['data'][1]['attachments'][suraNumber]['url'],
      );

      return sura;
    } catch (e) {
      return Sura(suraUrl: '');
    }
  }
}

class Sura {
  final String suraUrl;
  Sura({required this.suraUrl});
}
