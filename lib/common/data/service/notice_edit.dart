import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/notice_edit.dart';

import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class NoticeEditApi {
  Future<bool> noticeEdits(int noticeId, NoticeEdit notice) async {
    try {
      final accessToken = await Storage.read('accessToken');
      if (accessToken == null) {
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.patch(
        '${ApiEndpoints.update}/$noticeId',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
        data: notice.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad Request 잘못된 접근');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 관리자 권한이 없습니다');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error 서버 오류');
      }
      return false;
    }
  }
}
