import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class LogOutApi {
  Future<String> logOut() async {
    try {
      final accessToken = await Storage.read('accessToken');
      if(accessToken == null){
          throw Exception("토큰이 없습니다");
      }
      final response = await dio.post(
        ApiEndpoints.logout,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 204) {
        await Storage.delete('accessToken');
        return 'No content';
      } else {
        throw Exception("오류 (${response.statusCode})");
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        throw Exception('Internal Server Error');
      } else {
        throw Exception("오류 (${e.response!.statusCode})");
      }
    }
  }
}
