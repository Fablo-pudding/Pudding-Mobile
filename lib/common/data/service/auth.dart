import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class Auth {
  Future<bool> signUp({
    required String name,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.signUp,
        data: {
          'name': name,
          'password': password,
        },
      );
      if(response.statusCode == 201){
        return true;
      }
    } on DioException catch (e) {
      if(e.response?.statusCode == 400){
        throw Exception('Bad Request 잘못된 요청');
      }
      else if(e.response?.statusCode == 409){
        throw Exception('Conflict 중복된 사용자 이름입니다.');
      }
      else if(e.response?.statusCode == 500){
        throw Exception('Internal Server Error 서버 에러');
      }
    }
    return false;
  }

  Future<bool> signIn({
    required String name,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'name': name,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final accessToken = response.data['accessToken'];
        final refreshToken = response.data['refreshToken'];
        await Storage.write('accessToken', accessToken);
        await Storage.write('refreshToken', refreshToken);
        print(accessToken);
        print(refreshToken);
        return true;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Bad Request 잘못된 요청');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized 유저정보가 유효하지 않습니다.');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal Server Error 서버 오류');
      }
    }
    return false;
  }
}
