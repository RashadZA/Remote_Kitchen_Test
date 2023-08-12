part of 'base_service.dart';

class ApiException implements Exception {
  final String? message;
  final String? prefix;

  ApiException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message, "Bad Request: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message, "Data Not Found: ");
}

String getErrorMessageForDioErrors(DioError err) {
  switch (err.type) {
    case DioExceptionType.badResponse:
      return _returnResponseException(err.response);
    default:
      throw ApiException(err.message, 'Dio Exception: ');
  }
}

dynamic _returnResponseException(Response? response) {
  switch (response?.statusCode) {
    case 400:
      throw BadRequestException(response?.data['message'].toString());
    case 401:
    case 403:
      throw UnauthorisedException(response?.data['message'].toString());
    case 404:
      throw NotFoundException(response?.data['message'].toString());
    case 500:
      throw FetchDataException(response?.data['message'].toString());
    default:
      throw ApiException(
        '${response?.data["message"].toString()}',
        'Default Exception: ',
      );
  }
}