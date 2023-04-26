import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}

class HomeFailure extends Failure {
  HomeFailure(super.errMessage);

  factory HomeFailure.fromDio(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return HomeFailure('Connection timeout');
      case DioErrorType.sendTimeout:
        return HomeFailure('Send Timeout');
      case DioErrorType.receiveTimeout:
        return HomeFailure('Receive Timeout');
      case DioErrorType.badCertificate:
        return HomeFailure(
            'The connection to the server could not be established');
      case DioErrorType.badResponse:
        return HomeFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return HomeFailure('Request Canceled');
      case DioErrorType.connectionError:
        return HomeFailure('Connection Error,please try again!');
      case DioErrorType.unknown:
        if (dioError.error is SocketException) {
          return HomeFailure(
              'No Internet Connection, please check your internet and try again');
        } else {
          return HomeFailure('Opps There Was An Error, please try again!');
        }

      default:
        return HomeFailure('Opps There Was An Error, please try again!');
    }
  }

  factory HomeFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return HomeFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return HomeFailure('Request Not Found,please try later!');
    } else if (statusCode == 500) {
      return HomeFailure('Internal Server Error,please try later!');
    } else {
      return HomeFailure('Opps There Was An Error, please try again!');
    }
  }
}
