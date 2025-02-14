import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/constants/api_constants.dart';

final Dio dioInstance = Dio(
  BaseOptions(baseUrl: ApiConstants.baseURL),
);

void configureDio() {
  if (kDebugMode) {
    dioInstance.interceptors.add(DioInterceptor());
    dioInstance.interceptors
        .add(PrettyDioLogger(requestBody: true, responseBody: true));
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Authorization'] = 'Bearer';
    options.headers['accept'] = '*/*';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    debugPrint('\n\n\nmessage: B ${response.data}\n\n\n');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 400) {
      debugPrint('message : 401 yoki 400 chiqdi');
      // fireSnackBar(err.response!.data['message'].toString().contains("already exists") ?"Bu foydalanuvchi ro'yxatdan o'tgan" :err.response?.data['message'].toString() ?? "" , ToastificationType.error);
    }
    if (err.type == DioExceptionType.badResponse) {
      var response = err.response;
      String? message = response?.data['message'];
      debugPrint("Something went wrong $message");
    }
    super.onError(err, handler);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
