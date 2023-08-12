import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'logging_interceptor.dart';

class ApiInterceptor implements Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _attachAuthToken(options);
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  void _attachAuthToken(RequestOptions options) async {
    if (!options.extra.containsKey("requiresToken") ||
        !options.extra['requiresToken']) return;

    options.extra.remove("requiresToken");

    const String apiKey = "";
    const String apiSecret = "";

    options.headers.addAll({"Authorization": 'token $apiKey:$apiSecret'});
  }
}

