import 'package:drive_tunes/core/app_failures.dart';

sealed class Result<T> {}

final class SuccessResult<T> extends Result<T> {
  final T data;

  SuccessResult(this.data);
}

final class FailureResult<T> extends Result<T> {
  final AppFailure failure;
  final StackTrace? stackTrace;

  FailureResult(this.failure, {this.stackTrace});
}
