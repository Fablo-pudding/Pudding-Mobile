import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/inquiry_check.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class InquiryDetailApi {
  Future<InquiryCheck> inquiryDetailApi(int id) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.get(
          '${ApiEndpoints.inquiryDetailCheck}/$id',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'})
      );

      if (response.statusCode == 200) {
        return InquiryCheck.fromJson(response.data);
      }
      else {
        throw Exception('오류 (${response.statusCode})');
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 401) {
        throw Exception("접근 권한 없음");
      }
      else if (e.response?.statusCode == 403) {
        throw Exception("어드민 권한 없음 또는 본인 문의가 아님");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("해당 문의를 찾을 수 없음");
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