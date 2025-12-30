import 'package:dio/dio.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/constants/base_url.dart';

final Dio dio = Dio(
  dio.options = BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  ),
);
