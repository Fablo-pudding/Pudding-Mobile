import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class ItemPaymentApi {
  Future<bool> itemPayment(String ingredientItem) async {
    try {
      final accessToken = await Storage.read('accessToken');

      if (accessToken == null) {
        throw Exception('토큰이 없습니다');
      }
      final response = await dio.post(
        ApiEndpoints.ingredient,
        queryParameters: {'type' : ingredientItem, 'EGG': '1', 'SUGAR': '1', 'MILK': '1'},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        throw Exception('Bad Request 잘못된 요청');
      } else if (e.response!.statusCode == 401) {
        throw Exception('Unauthorized 권한 없음');
      } else if (e.response!.statusCode == 404) {
        throw Exception('Not Found 재료를 찾을 수 없습니다');
      } else {
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}
