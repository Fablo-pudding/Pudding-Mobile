import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/inquiry_check.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class InquiryAdminCheckApi {
  Future<List<InquiryCheck>> inquiryAdminCheck() async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.get(
          ApiEndpoints.inquiryAllCheck,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'})
      );

      if (response.statusCode == 200) {
        return (response.data as List).map((e) => InquiryCheck.fromJson(e)).toList();
      }
      else {
        throw ("오류 (${response.statusCode})");
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw ("네트워크 오류");
      }
      else if (e.response?.statusCode == 403) {
        throw ("관리자만 문의 조회가 가능합니다,");
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