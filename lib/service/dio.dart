import 'package:dio/dio.dart';
import 'package:pudding/common/constants/base_url_example.dart';


final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  ),
);
