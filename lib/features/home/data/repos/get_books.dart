import 'package:dio/dio.dart';

class GetBooks {
  final dio = Dio();

  Future<Map<String, dynamic>> get({required String URL}) async {
    final response = await dio.get(URL);
    return response.data;
  }
}
