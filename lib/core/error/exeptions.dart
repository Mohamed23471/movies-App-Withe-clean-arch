import 'package:movie_app/core/network/error_massage_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
    required errorMassage,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}
