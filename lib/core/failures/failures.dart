import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDio(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioErrorType.badCertificate:
        return ServerFailure(
            'The connection to the server could not be established');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request Canceled');
      case DioErrorType.connectionError:
        return ServerFailure('Connection Error,please try again!');
      case DioErrorType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure(
              'No Internet Connection, please check your internet and try again');
        } else {
          return ServerFailure('Opps There Was An Error, please try again!');
        }

      default:
        return ServerFailure('Opps There Was An Error, please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request Not Found,please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error,please try later!');
    } else {
      return ServerFailure('Opps There Was An Error, please try again!');
    }
  }
}
