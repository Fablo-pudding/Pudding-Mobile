import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class Reply {
  Future<void> reply({required String reply, required int id}) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인이 필요합니다.");
      }

      final response = await dio.post(
        '${ApiEndpoints.inquiryAnswer}/$id/reply',
        data: {'reply': reply},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 201) {
        return;
      }
      else {
        throw ("오류 (${response.statusCode})");
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw ("네트워크 오류");
      }
      else if (e.response?.statusCode == 403) {
        throw ("관리자만 답변 작성이 가능합니다,");
      }
      else if (e.response?.statusCode == 404) {
        throw ("문의를 찾을 수 없음");
      }
      else if (e.response?.statusCode == 500) {
        throw ("서버 오류");
      }
      else {
        throw ("오류 (${e.response?.statusCode})");
      }
    }
  }
}