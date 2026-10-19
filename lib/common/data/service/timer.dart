import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class TimerService {
  Future<int> timerCreate({
    required int elapsedTime,
  }) async {
    try {
      final accessToken = await Storage.read('accessToken');
      final response = await dio.post(
        ApiEndpoints.createTimer,
        data: {
          'elapsedTime': elapsedTime,
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 201) {
        return 0;
      }
      else{
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 토큰 없음 / 만료됨');
      } else if (e.response?.statusCode == 409) {
        throw Exception('Conflict 타이머가 이미 생성되어있습니다');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error');
      } else {
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}