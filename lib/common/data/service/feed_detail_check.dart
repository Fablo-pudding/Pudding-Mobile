import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/feed_detail_check.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class CheckFeedDetail {
  Future<FeedDetailCheck> feedDetailCheck(int postId) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인이 필요합니다.");
      }

      final response = await dio.get(
        '${ApiEndpoints.feedDetailCheck}/$postId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return FeedDetailCheck.fromJson(response.data);
      }
      else {
        throw Exception('오류 (${response.statusCode})');
      }
    } on DioException catch(e) {

      if (e.response?.statusCode == null) {
        throw Exception("오류 (${e.response?.statusCode})");
      }
      else if (e.response?.statusCode == 401) {
       throw Exception("권한 없음");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("게시물을 찾을 수 없음");
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