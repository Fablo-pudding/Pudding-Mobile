import 'package:dio/dio.dart';
import 'package:pudding/common/data/models/text_input.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/create_response.dart';

class FeedCreate {
  Future<int> feedCreate({
    required String title,
    required String content,
  }) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인이 필요합니다.");
      }

      final response = await dio.post(
        ApiEndpoints.feedWrite,
        data: {'title': title, 'content': content},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 201) {
        return response.data as int;
      }
      else {
        throw Exception("오류 (${response.statusCode})");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 400) {
        throw Exception("필수 입력값 누락 혹은 본문 길이 초과");
      }
      else if (e.response?.statusCode == 401) {
        throw Exception("권한 없음");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("유저를 찾을 수 없음");
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