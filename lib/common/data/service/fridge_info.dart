import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/storage_info.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';


class FridgeInfo {

  Future<StorageInfo> fridgeInfo() async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception("로그인 필요");
      }

      final response = await dio.get(
          ApiEndpoints.storageCheck,
          options: Options(headers: {'Authorization':'Bearer $accessToken'})
      );

      if (response.statusCode == 200) {
        return StorageInfo.fromJson(response.data);
      }
      else {
        throw Exception("알 수 없는 오류");
      }
    } on DioException catch(e) {

      if (e.response?.statusCode == null) {
        throw Exception("네트워크 오류");
      }
      else if (e.response?.statusCode == 400) {
        throw Exception("유효하지 않은 푸딩 갯수");
      }
      else if (e.response?.statusCode == 401) {
        throw Exception("인증 만료");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("재료 혹은 푸딩을 찾을 수 없습니다.");
      }
      else if (e.response?.statusCode == 500) {
        throw Exception("서버 오류");
      }
      else {
        throw Exception("알 수 없는 오류");
      }
    }
  }
}