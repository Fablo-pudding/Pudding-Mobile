import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/timer_response.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class TimerCheck {
  Future<TimerResponse> timerCheck() async {
    try {
      final accessToken = await Storage.read('accessToken');
      final response = await dio.get(
        ApiEndpoints.timerCheck,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return TimerResponse.fromJson(response.data);
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 토큰 없음/만료');
      } else if (e.response?.statusCode == 404) {
        throw Exception('[TimerCheck] 타이머 없음 (404)');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error 서버 에러');
      } else {
        throw Exception('에러 ${e.response!.statusCode}');
      }
    }
  }
}
