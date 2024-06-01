import 'package:dio/dio.dart';
import 'package:responsive/shared/constant.dart';

class ApiServer {
  Dio dio;
  ApiServer(this.dio);
  Future<Map<String, dynamic>> postProfileData(
      {required Map<String, dynamic> data,
      required String endPoint,
      String? token}) async {
    var response = await dio.post("$baseUrl/$endPoint",
        data: data,
        options: Options(
            headers: token != null
                ? {
                    'Authorization': 'Bearer $token',
                  }
                : null));

    return response.data;
  }

  Future<Map<String, dynamic>> getProfilData(
      {required String endPoint, String? token}) async {
    var response = await dio.get(
      "$baseUrl/$endPoint",
      options: Options(
          headers: token != null
              ? {
                  'Authorization': 'Bearer $token',
                }
              : null),
    );

    return response.data;
  }
}
