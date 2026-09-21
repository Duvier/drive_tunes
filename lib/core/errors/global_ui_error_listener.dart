import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/app/router.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';

class GlobalUiErrorListener extends ConsumerStatefulWidget {
  final Widget child;
  final UiErrorBus errorBus;

  const GlobalUiErrorListener({
    super.key,
    required this.child,
    required this.errorBus,
  });

  @override
  ConsumerState<GlobalUiErrorListener> createState() =>
      _GlobalUiErrorListenerState();
}

class _GlobalUiErrorListenerState extends ConsumerState<GlobalUiErrorListener> {
  StreamSubscription<UiError>? _subscription;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _subscription = widget.errorBus.stream.listen(_handleGlobalError);
  }

  void _handleGlobalError(UiError error) {
    if (!mounted) return;
    switch (error.displayType) {
      case UiErrorDisplayType.snackBar:
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            persist: false,
            content: Text(error.message),
            backgroundColor:
                error.severity == UiErrorSeverity.error ||
                    error.severity == UiErrorSeverity.critical
                ? Colors.red.shade500
                : Colors.orange.shade800,
            action: error.action != null
                ? SnackBarAction(
                    label: 'Reintentar',
                    textColor: Colors.white,
                    onPressed: error.action!,
                  )
                : null,
          ),
        );
        break;

      case UiErrorDisplayType.dialog:
        if (_isDialogShowing) return;
        final navigatorContext = rootNavigatorKey.currentContext;

        if (navigatorContext == null) {
          return;
        }

        showDialog(
          context: navigatorContext,
          builder: (ctx) => AlertDialog(
            title: Text(error.title ?? 'Error'),
            content: Text(error.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Aceptar'),
              ),
              if (error.action != null)
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    error.action!();
                  },
                  child: const Text('Reintentar'),
                ),
            ],
          ),
        ).then((_) {
          _isDialogShowing = false;
        });
        break;

      case UiErrorDisplayType.inline:
      case UiErrorDisplayType.banner:
        // Los errores inline/banner son manejados preferentemente a nivel de página/feature
        break;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
