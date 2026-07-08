import 'package:dio/dio.dart';
import 'package:signage_player/core/extensions.dart';

class DioInstance {
  DioInstance._();
  static final DioInstance _instance = DioInstance._();
  factory DioInstance() => _instance;

  late final Dio dio;

  void init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(DownloadInterceptor());
  }
}

class DownloadInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    'STARTING DOWNLOAD: ${options.uri}'.logInfo();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    'DOWNLOAD SUCCESSFUL: ${response.requestOptions.uri}'.logInfo();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    'DOWNLOAD FAILED: ${err.requestOptions.uri} | Error: ${err.message}'
        .logError();
    super.onError(err, handler);
  }
}
