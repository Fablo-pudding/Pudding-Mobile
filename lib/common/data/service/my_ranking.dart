import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/my_ranking.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class MyRankingApi {
  Future<MyRanking> myRanking() async {
    try {
      final accessToken = await Storage.read('accessToken');
      final response = await dio.get(
        ApiEndpoints.my,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return MyRanking.fromJson(response.data);
      } else {
        throw Exception('에러 ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        throw Exception('Internal Server Error');
      } else {
        throw Exception('에러 ${e.response!.statusCode}');
      }
    }
  }
}
