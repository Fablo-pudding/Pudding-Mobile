import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class FeedDelete {
  Future<void> feedDelete(int postId) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.delete(
        '${ApiEndpoints.feedDelete}/$postId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 204) {
        return;
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 401) {
        throw Exception("권한 없음");
      }
      else if (e.response?.statusCode == 403) {
        throw Exception("작성자 본인이 아님");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("없는 게시물");
      }
      else if (e.response?.statusCode == 409) {
        throw Exception("게시물 삭제 중 오류 발생");
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