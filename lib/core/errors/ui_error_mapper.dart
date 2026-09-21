import 'package:flutter/foundation.dart';
import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/errors/ui_error.dart';

abstract class UiErrorMapper {
  UiError map(
    Object error, {
    StackTrace? stackTrace,
    String? feature,
    VoidCallback? action,
    UiErrorSeverity? severity,
  });
}

class UiErrorMapperImpl implements UiErrorMapper {
  const UiErrorMapperImpl();

  @override
  UiError map(
    Object error, {
    StackTrace? stackTrace,
    String? feature,
    VoidCallback? action,
    UiErrorSeverity? severity,
  }) {
    if (error is UiError) return error;

    if (error is AppFailure) {
      return _mapAppFailure(
        error,
        feature: feature,
        action: action,
        stackTrace: stackTrace,
      );
    }

    if (error is AppException) {
      return UiError(
        message: error.message,
        feature: feature,
        originalError: error,
        stackTrace: stackTrace,
        action: action,
      );
    }

    return UiError(
      message: 'Ha ocurrido un error inesperado. Por favor, reintente.',
      severity: severity ?? UiErrorSeverity.error,
      feature: feature,
      originalError: error,
      stackTrace: stackTrace,
      action: action,
    );
  }

  UiError _mapAppFailure(
    AppFailure failure, {
    String? feature,
    VoidCallback? action,
    StackTrace? stackTrace,
  }) {
    return switch (failure) {
      PermissionFailure() => UiError(
        title: 'Acceso Denegado',
        message: failure.message,
        severity: UiErrorSeverity.warning,
        displayType: UiErrorDisplayType.dialog,
        feature: feature,
        action: action,
        originalError: failure,
        stackTrace: stackTrace,
      ),
      FileSystemFailure() => UiError(
        message: failure.message,
        displayType: UiErrorDisplayType.snackBar,
        feature: feature,
        action: action,
        originalError: failure,
        stackTrace: stackTrace,
      ),
      DatabaseFailure() => UiError(
        message: failure.message,
        severity: UiErrorSeverity.error,
        displayType: UiErrorDisplayType.snackBar,
        feature: feature,
        action: action,
        originalError: failure,
        stackTrace: stackTrace,
      ),
      SynchronizationFailure() => UiError(
        message: failure.message,
        displayType: UiErrorDisplayType.banner,
        feature: feature,
        action: action,
        originalError: failure,
        stackTrace: stackTrace,
      ),
      UnknownFailure() => UiError(
        message: failure.message,
        feature: feature,
        action: action,
        originalError: failure,
        stackTrace: stackTrace,
      ),
    };
  }
}
