import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getMethod({required String apiUrl}) async {
    try {
      Response response = await dio.get(apiUrl);
      return response.data;
    } catch (e) {
      return {};
    }
  }
}
