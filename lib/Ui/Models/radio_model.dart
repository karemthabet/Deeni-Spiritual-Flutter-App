class RadioModel {
  final String url;
  final String name;
  RadioModel({required this.url, required this.name});

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      name: json["radios"][13]["name"],
      url: json["radios"][13]["url"],
    );
  }
}
