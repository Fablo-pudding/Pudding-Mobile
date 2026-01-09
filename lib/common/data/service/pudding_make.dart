import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/pudding_make.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class PuddingMake {

  Future<StorageMake> puddingMake() async {
    try {
      final accessToken = await Storage.read('accessToken');
      print(accessToken);

      final response = await dio.post(
        ApiEndpoints.make,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'})
      );

      if (response.statusCode == 201) {
        return StorageMake.fromJson(response.data);
      }
      else {
        throw Exception("알 수 없는 오류");
      }
    } on DioException catch(e) {
      if (e.response?.statusCode == 400) {
        throw Exception("재료 부족");
      }
      else if (e.response?.statusCode == 401) {
        throw Exception("인증 만료");
      }
      else if (e.response?.statusCode == 403) {
        throw Exception("권한 없음");
      }
      else if (e.response?.statusCode == 404) {
        throw Exception("냉장고 데이터 없음");
      }
      else if (e.response?.statusCode == 500) {
        throw Exception("서버 오류");
      }
      else {
        throw Exception("네트워크 오류");
      }
    }
  }
}