import 'dart:async';

extension TimeoutsExtension<T extends Object?> on Future<T> {
  Future<T> logicTimeout({
    double coefficient = 1,
    FutureOr<T> Function()? onTimeout,
  }) =>
      timeout(
        const Duration(milliseconds: 10000) * coefficient,
        onTimeout: onTimeout,
      );
}
