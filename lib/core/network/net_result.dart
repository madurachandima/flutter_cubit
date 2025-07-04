import 'net_exception.dart';

class Result<Type> {
  Type? result;
  NetException? exception;
  int? statusCode;
  String? token;
  Map<String, dynamic>? extra;

  Result(
      {this.result, this.exception, this.statusCode, this.token, this.extra});

  bool isSuccess() {
    if (exception == null) return true;
    return false;
  }
}
