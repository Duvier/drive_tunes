import 'package:flutter/foundation.dart';

enum UiErrorSeverity { info, warning, error, critical }

enum UiErrorDisplayType { snackBar, dialog, inline, banner }

final class UiError {
  final String id;
  final String message;
  final String? title;
  final UiErrorSeverity severity;
  final UiErrorDisplayType displayType;
  final String? feature; // null indica error global
  final VoidCallback? action;
  final Object? originalError;
  final StackTrace? stackTrace;

  UiError({
    required this.message,
    this.title,
    this.severity = UiErrorSeverity.error,
    this.displayType = UiErrorDisplayType.snackBar,
    this.feature,
    this.action,
    this.originalError,
    this.stackTrace,
    String? id,
  }) : id = id ?? DateTime.now().microsecondsSinceEpoch.toString();

  @override
  String toString() {
    return 'UiError(id: $id, message: $message, title: $title, severity: $severity, displayType: $displayType, feature: $feature)';
  }
}
