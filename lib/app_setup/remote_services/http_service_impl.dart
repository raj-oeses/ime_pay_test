import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../failure_model.dart';
import 'http_service.dart';

/// Http service implementation using the Dio package
class HttpServiceImpl implements HttpService {
  HttpServiceImpl({Dio? dioOverride}) {
    dio = dioOverride ?? Dio(baseOptions);
    // dio.interceptors.add(NetworkInterceptor());
  }

  /// The Dio Http client
  late final Dio dio;

  @override
  String get baseUrl => 'https://run.mocky.io/v3/';

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(baseUrl: baseUrl);

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      String? customBaseUrl,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      print('options::::: ${options?.headers}\n endPoint $endpoint');
      final Response<dynamic> response =
          await dio.get<Map<String, dynamic>>(endpoint);
      print('Success:::::${response.data as Map<String, dynamic>}');
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      print('$e');
      return Left(e.toFailure);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
