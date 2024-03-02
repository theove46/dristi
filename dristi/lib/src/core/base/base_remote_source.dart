import 'package:dio/dio.dart';
import 'package:dristi/src/core/flavors/build_config.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/core/network/error_handlers.dart';
import 'package:dristi/src/core/network/exceptions/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      return response;
    } on DioException catch (dioException) {
      Exception exception = handleDioError(dioException);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
