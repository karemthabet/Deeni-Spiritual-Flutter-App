import 'package:islamy_app/Ui/Models/radio_model.dart';
import 'package:islamy_app/core/helper/api_services.dart';

class RadioServices {
  Future<RadioModel> getRadio() async {
    Map<String, dynamic> json = await ApiServices()
        .getMethod(apiUrl: "https://data-rosy.vercel.app/radio.json");

    return RadioModel.fromJson(json);
  }
}
