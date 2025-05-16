import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class DioAdapterHelper {
  static DioAdapter createDioAdapter({
    required Dio dio,
    required Map<String, dynamic> routes,
  }) {
    final dioAdapter = DioAdapter(
      dio: dio,
      matcher: const FullHttpRequestMatcher(),
    );

    routes.forEach((route, response) {
      dioAdapter.onGet(
        route,
        (server) => server.reply(
          response['statusCode'],
          response['data'],
          delay: const Duration(seconds: 1),
        ),
      );
    });

    return dioAdapter;
  }
}
