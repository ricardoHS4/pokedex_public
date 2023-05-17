import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiService {
  // Interceptor for cache is added to improve user experience online and offline
  static Dio dio = Dio()
    ..interceptors.add(DioCacheManager(CacheConfig(
            defaultMaxAge: const Duration(days: 14),
            defaultMaxStale: const Duration(days: 28)))
        .interceptor);
  static Response<dynamic>? response;

  ApiService();

  Future<Response> getHttp(String url) async {
    response = await dio.get(
      url,
      options: buildCacheOptions(
        const Duration(days: 14),
        maxStale: const Duration(days: 28),
      ),
    );
    return response!;
  }
}
