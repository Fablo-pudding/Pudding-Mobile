import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/create_response.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class InquiryCreate {
  Future<CreateResponse> inquiryCreate({
    required String title,
    required String content
  }) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인이 필요합니다.");
      }

      final response = await dio.post(
        ApiEndpoints.inquiryRegister,
        data: {'title': title, 'content': content},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 201) {
        return CreateResponse.fromJson(response.data);
      }
      else {
        throw Exception("오류 (${response.statusCode})");
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 500) {
        throw Exception("서버 오류");
      }
      else {
        throw Exception("오류 (${e.response?.statusCode})");
      }
    }
  }
}