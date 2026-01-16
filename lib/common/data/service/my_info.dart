import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/models/my_info.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class MyInfoApi {
  Future<MyInfo?> myInfo() async {
    try {
      final accessToken = await Storage.read('accessToken');
      if(accessToken == null){
        print('accessToken이 없습니다');
      }
      final response = await dio.get(
        ApiEndpoints.myInfo,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return MyInfo.fromJson(response.data);
      }
    }
   on DioException catch(e){
      if(e.response?.statusCode == 401){
        throw Exception('토큰 만료/ 인증 토큰이 없음');
      }
      else if(e.response?.statusCode == 403){
        throw Exception('권한 없음');
      }
      else if(e.response?.statusCode == 500){
        throw Exception('서버 오류');
      }
   }
    return null;
  }
}
