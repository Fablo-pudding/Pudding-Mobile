import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/feed_check.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class CheckFeed {
  Future<List<FeedCheck>> feedCheck() async {
    try {
      final accessToken = await Storage.read('accessToken');

      if(accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.get(
        ApiEndpoints.feedCheck,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'})
      );

      if (response.statusCode == 200) {
        return (response.data as List).map((e) => FeedCheck.fromJson(e)).toList();
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