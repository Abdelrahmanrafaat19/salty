import 'package:dio/dio.dart';
import 'package:responsive/shared/constant.dart';

class ApiServer {
  Dio dio;
  ApiServer(this.dio);
  Future<Map<String, dynamic>> postProfileData(
      {required Map<String, dynamic> data, required String endPoint}) async {
    var response = await dio.post("$baseUrl/$endPoint", data: data);

    return response.data;
  }
}
