import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../failure_model.dart';

/// Http Service Interface
abstract class HttpService {
  /// Http base url
  String get baseUrl;

  /// Http get request
  Future<Either<Failure, Map<String, dynamic>>> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options});
}
