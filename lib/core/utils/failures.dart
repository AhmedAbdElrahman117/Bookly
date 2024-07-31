import 'package:dio/dio.dart';

class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

class DioFailed extends Failures {
  DioFailed(super.errorMessage);
  factory DioFailed.badResponse(int? statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return DioFailed(response['error']['message']);
    } else if (statuscode == 404) {
      return DioFailed('Request Not Found');
    } else {
      return DioFailed('Internal Error, Try Again Later');
    }
  }
  factory DioFailed.fromError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DioFailed('Connection TimeOut');
      case DioExceptionType.sendTimeout:
        return DioFailed('Send TimeOut');
      case DioExceptionType.receiveTimeout:
        return DioFailed('Recieve TimeOut');
      case DioExceptionType.badCertificate:
        return DioFailed('Bad Certification');
      case DioExceptionType.badResponse:
        DioFailed.badResponse(error.response!.statusCode, error.response);
      case DioExceptionType.cancel:
        return DioFailed('Connection Cancelled');
      case DioExceptionType.connectionError:
        return DioFailed('Connection Error');
      case DioExceptionType.unknown:
        return DioFailed('Unknown Error Try Again Later');
    }
    return DioFailed('Unknown Error');
  }
}
