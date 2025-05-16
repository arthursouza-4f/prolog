import 'package:dio/dio.dart';

class DioSuport {
  final Dio _dio = Dio();

  DioSuport() {
    _dio.options.baseUrl = 'https://prologapp.com/prolog';

    _dio.options.headers = {
      'x-prolog-api-token': 'ePTC2XrkY34WKUCXq48fTxrLCzdV3M35MNpCfBYavabwwY9BJXg'
    };

    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Dio get dio => _dio;
}


