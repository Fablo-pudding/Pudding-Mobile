import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/pudding_one_upgrade.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class PuddingUpgradeOne {
  Future<PuddingOneUpgrade> puddingUpgradeOne() async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.post(
        ApiEndpoints.upgradeOne,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'})
      );

      if (response.statusCode == 201) {
        return PuddingOneUpgrade.fromJson(response.data);
      }
      else {
        throw Exception("오류 (${response.statusCode})");
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 400) {
        throw Exception("1성 푸딩 부족");
      }
      else if (e.response?.statusCode == 403) {
        throw Exception("내 푸딩 아님");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("존재하지 않는 푸딩");
      }
      else if (e.response?.statusCode == 409) {
        throw Exception("보유 수량 부족");
      }
      else {
        throw Exception("오류 (${e.response?.statusCode})");
      }
    }
  }
}