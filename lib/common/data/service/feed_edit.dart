import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/text_input.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class FeedEdit {
  Future<void> feedEdit({required int postId, required String title, required String content}) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.patch(
        '${ApiEndpoints.feedUpdate}/$postId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
        data: {'title': title, 'content': content},
      );

      if (response.statusCode == 200) {
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
        throw Exception("존재하지 않는 게시물");
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