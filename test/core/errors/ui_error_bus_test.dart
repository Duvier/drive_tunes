import 'package:flutter_test/flutter_test.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/errors/ui_error_mapper.dart';

void main() {
  late UiErrorMapper mapper;
  late UiErrorBus bus;

  setUp(() {
    mapper = const UiErrorMapperImpl();
    bus = UiErrorBusImpl(mapper: mapper);
  });

  tearDown(() {
    bus.dispose();
  });

  group('UiErrorBus Tests', () {
    test('Should emit UiError to global stream', () async {
      final error = UiError(message: 'Global Error');

      expectLater(bus.stream, emits(error));

      bus.emit(error);
    });

    test('Should map and emit raw error via emitMapped', () async {
      final failure = FileSystemFailure();

      expectLater(
        bus.stream,
        emits(
          predicate<UiError>(
            (e) => e.message == failure.message && e.feature == 'player',
          ),
        ),
      );

      bus.emitMapped(failure, feature: 'player');
    });

    test('Should filter errors by feature in streamForFeature', () async {
      final libraryError = UiError(message: 'Lib error', feature: 'library');
      final playerError = UiError(message: 'Player error', feature: 'player');

      final libraryEvents = <UiError>[];
      final subscription = bus
          .streamForFeature('library')
          .listen(libraryEvents.add);

      bus.emit(libraryError);
      bus.emit(playerError);

      await Future.delayed(Duration.zero);

      expect(libraryEvents.length, equals(1));
      expect(libraryEvents.first.message, equals('Lib error'));

      await subscription.cancel();
    });
  });
}
