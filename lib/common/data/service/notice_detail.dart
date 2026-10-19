import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/notice_detail.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class NoticeDetailApi {
  Future<NoticeDetail> noticeDetail(int noticeId) async {
    try {
      final accessToken = await Storage.read('accessToken');
      if (accessToken == null) {
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.get(
        '${ApiEndpoints.noticeDetail}/$noticeId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return NoticeDetail.fromJson(response.data);
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad Request 잘못된 요청');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 권한없음');
      } else if (e.response?.statusCode == 403) {
        throw Exception('Forbidden 권한없음');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Not Found 해당 id공지를찾을수없음');
      } else {
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}
