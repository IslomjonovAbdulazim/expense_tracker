// lib/utils/errors/network_failure.dart
class NetworkFailure {
  final String? message;
  final int? statusCode;

  NetworkFailure({
    required this.message,
    required this.statusCode,
  });
}
