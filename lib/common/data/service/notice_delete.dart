import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class NoticeDeleteApi {
  Future<String> noticeDelete(int noticeId) async {
    try {
      final accessToken = await Storage.read('accessToken');
      if (accessToken == null) {
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.delete(
        '${ApiEndpoints.delete}/$noticeId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 204 || response.statusCode == 200) {
        return '삭제되었습니다';
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad request 잘못된 접근');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 관리자 권한이 없습니다');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Not Found 이미 삭제된 공지');
      } else if (e.response?.statusCode == 409) {
        throw Exception('Conflict 이미 삭제되어 삭제될 수 없습니다');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error 서버오류');
      } else {
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}
