import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/service/dio.dart';
import 'package:pudding/views/auth_page/presentation/model/info_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth.g.dart';

@Riverpod()
Future<bool> signUp(Ref ref, {
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
    if (response.statusCode == 201) {
      return true;
    }
    else if (response.statusCode == 400) {
      return false;
    }
    else if (response.statusCode == 409) {
      return false;
    }
    else if (response.statusCode == 500) {
      return false;
    }
    return false;
  } catch (err) {
    print(err);
    return false;
  }
}


@Riverpod()
Future<bool> signIn(Ref ref, {
  required String name,
  required String password,
}) async {
  try {
    final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'name': name,
          'password': password,
        }
    );

    if (response.statusCode == 200) {
      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];
      final storage = const FlutterSecureStorage();
      await storage.write(key: 'accessToken', value: accessToken);
      await storage.write(key: 'refreshToken', value: refreshToken);
      print(accessToken);
      print(refreshToken);
      return true;
    }
    else if (response.statusCode == 400) {
      return false;
    }
    else if (response.statusCode == 401) {
      return false;
    }
    else if (response.statusCode == 500) {
      return false;
    }
    return false;
  }
  catch (err) {
    print(err);
    return false;
  }
}

@riverpod
Future<InfoResponse> myInfo(Ref ref) async {
  final storage = const FlutterSecureStorage();
  final accessToken = await storage.read(key: 'accessToken');
  try {
    final response = await dio.get(ApiEndpoints.myInfo,
        options: Options(
            headers: {'Authorization': 'Bearer $accessToken'}
        )
    );
    if(response.statusCode == 200){
      return InfoResponse.fromJson(response.data);
    }
    else{
      throw Exception(response.statusCode);
    }
  }
  catch (err) {
    print(err);
    rethrow;
  }
}