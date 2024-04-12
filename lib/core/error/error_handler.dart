import 'package:dio/dio.dart';

class Failures {
  Failures(this.code, this.message);

  int code;
  String message;
}

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.kDefault.getFailure();
    }
  }

  late Failures failure;
}

Failures _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        return Failures(error.response?.statusCode ?? 0, error.response?.data['message'] ?? '');
      } else {
        return DataSource.kDefault.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.kDefault.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  kDefault
}

extension DataSourceExtension on DataSource {
  Failures getFailure() {
    switch (this) {
      case DataSource.success:
        return Failures(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failures(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failures(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failures(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failures(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failures(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failures(ResponseCode.internalServerError, ResponseMessage.internalServerError);
      case DataSource.connectionTimeout:
        return Failures(ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case DataSource.cancel:
        return Failures(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failures(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failures(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failures(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failures(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case DataSource.kDefault:
        return Failures(ResponseCode.kDefault, ResponseMessage.kDefault);
    }
  }
}

class ResponseCode {
  /// success with data

  static const int success = 200;

  /// success with no data (no content)

  static const int noContent = 201;

  /// failure, API rejected request

  static const int badRequest = 400;

  /// failure, user is not authorised

  static const int unauthorised = 401;

  ///  failure, API rejected request

  static const int forbidden = 403;

  /// failure, crash in server side

  static const int internalServerError = 500;

  /// failure, not found

  static const int notFound = 404;

  /// local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int kDefault = -7;
}

class ResponseMessage {
  static const String success = AppStringsWithLocale.success;
  static const String noContent = AppStringsWithLocale.success;
  static const String badRequest = AppStringsWithLocale.badRequestError;
  static const String unauthorised = AppStringsWithLocale.unauthorizedError;
  static const String forbidden = AppStringsWithLocale.forbiddenError;
  static const String internalServerError = AppStringsWithLocale.internalServerError;
  static const String notFound = AppStringsWithLocale.notFoundError;

  /// local status message
  static const String connectionTimeout = AppStringsWithLocale.timeoutError;
  static const String cancel = AppStringsWithLocale.defaultError;
  static const String receiveTimeout = AppStringsWithLocale.timeoutError;
  static const String sendTimeout = AppStringsWithLocale.timeoutError;
  static const String cacheError = AppStringsWithLocale.cacheError;
  static const String noInternetConnection = AppStringsWithLocale.noInternetError;
  static const String kDefault = AppStringsWithLocale.defaultError;
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 400;
}

class AppStringsWithLocale {
  static const String badRequestError = 'bad_request_error';
  static const String noContent = 'no_content';
  static const String forbiddenError = 'forbidden_error';
  static const String unauthorizedError = 'unauthorized_error';
  static const String notFoundError = 'not_found_error';
  static const String conflictError = 'conflict_error';
  static const String internalServerError = 'internal_server_error';
  static const String unknownError = 'unknown_error';
  static const String timeoutError = 'timeout_error';
  static const String defaultError = 'default_error';
  static const String cacheError = 'cache_error';
  static const String noInternetError = 'no_internet_error';
  static const String success = 'success';
}

class AppStringsWithoutLocale {
  static const String badRequestError = 'Bad request error';
  static const String noContent = 'No content';
  static const String forbiddenError = 'Forbidden error';
  static const String unauthorizedError = 'Unauthorized error';
  static const String notFoundError = 'Not found error';
  static const String conflictError = 'Conflict error';
  static const String internalServerError = 'Internal server error';
  static const String unknownError = 'Unknown error';
  static const String timeoutError = 'Timeout error';
  static const String defaultError = 'Default error';
  static const String cacheError = 'Cache error';
  static const String noInternetError = 'No internet error';
  static const String success = 'Success';
}
