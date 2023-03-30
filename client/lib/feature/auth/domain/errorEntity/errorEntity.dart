import 'package:dio/dio.dart';

class ErrorEntity {
  final String message;
  final String? errorMessage;
  final dynamic error;
  final StackTrace? stackTrace;
  ErrorEntity({
    required this.message,
    this.errorMessage,
    this.error,
    this.stackTrace,
  });

  factory ErrorEntity.fromException(dynamic error) {
    if (error is ErrorEntity) return error;
    final entity = ErrorEntity(message: "Неизвестаня ошибка");
    if (error is DioError) {
      try {
        return ErrorEntity(
          message: error.response?.data["message"] ?? "Неизвестаня ошибка",
          errorMessage: error.response?.data["error"] ?? "Неизвестаня ошибка",
          stackTrace: error.stackTrace,
          error: error,
        );
      } catch (e) {
        return entity;
      }
    }
    return entity;
  }
}
