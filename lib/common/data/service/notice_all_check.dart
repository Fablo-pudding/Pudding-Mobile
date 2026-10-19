import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/notice_check.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class NoticeAllCheckApi {
  Future<List<NoticeCheck>> noticeAllCheck() async {
    try {
      final accessToken = await Storage.read('accessToken');
      if(accessToken == null){
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.get(
        ApiEndpoints.noticeCheck,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      if (response.statusCode == 200) {
        return NoticeCheckList.fromJson(response.data).check;
      } else {
        throw Exception('예외 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad Request 잘못된 접근');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Bad Request 잘못된 접근');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Not Found 공지가 없습니다');
      } else {
        throw Exception('${e.response?.statusCode}');
      }
    }
  }
}
