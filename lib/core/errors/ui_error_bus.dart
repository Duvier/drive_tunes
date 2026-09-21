import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/core/errors/ui_error_mapper.dart';

abstract class UiErrorBus {
  Stream<UiError> get stream;

  Stream<UiError> streamForFeature(String featureName);

  void emit(UiError error);

  void emitMapped(
    Object error, {
    StackTrace? stackTrace,
    String? feature,
    VoidCallback? action,
    UiErrorSeverity? severity,
  });

  void dispose();
}

class UiErrorBusImpl implements UiErrorBus {
  final UiErrorMapper _mapper;
  final StreamController<UiError> _controller =
      StreamController<UiError>.broadcast();

  UiErrorBusImpl({required this._mapper});

  @override
  Stream<UiError> get stream => _controller.stream;

  @override
  Stream<UiError> streamForFeature(String featureName) {
    return _controller.stream.where((error) => error.feature == featureName);
  }

  @override
  void emit(UiError error) {
    if (!_controller.isClosed) {
      _controller.add(error);
    }
  }

  @override
  void emitMapped(
    Object error, {
    StackTrace? stackTrace,
    String? feature,
    VoidCallback? action,
    UiErrorSeverity? severity,
  }) {
    final uiError = _mapper.map(
      error,
      stackTrace: stackTrace,
      feature: feature,
      action: action,
      severity: severity,
    );
    emit(uiError);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
