import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/create_response.dart';
import 'package:pudding/common/data/models/text_input.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class NoticeCreateApi {
  Future<CreateResponse> noticeCreate({
    required String title,
    required String content,
  }) async {
    try {
      final accessToken = await Storage.read('accessToken');
      if (accessToken == null) {
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.post(
        ApiEndpoints.noticeWrite,
        data: {'title': title, 'content': content},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return CreateResponse.fromJson(response.data);
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad Request 제목 없음');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 권한 없음');
      } else if (e.response?.statusCode == 403) {
        throw Exception('Forbidden admin 권한을 가지고 있지 않음');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error 서버 오류');
      } else {
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}
