import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/dio.dart';
import 'package:pudding/common/data/service/secure_storage.dart';

class InquiryDeleteApi {
  Future<bool> inquiryDelete(int inquiryId) async {
    try {
      final accessToken = await Storage.read('accessToken');
      final response = await dio.delete(
        '${ApiEndpoints.inquiryDelete}/$inquiryId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if(response.statusCode == 204){
        return true;
      }
      else{
        return false;
      }
    } on DioException catch (e) {
      if(e.response?.statusCode == 400){
        throw Exception('Bad Request 존재하지 않는 문의글');
      }
      else if(e.response?.statusCode == 403){
        throw Exception('Forbidden 작성자 본인이 아님');
      }
      else if(e.response?.statusCode == 500){
        throw Exception('Internal Server Error 서버에러');
      }
      else{
        throw Exception('에러 ${e.response?.statusCode}');
      }
    }
  }
}
