part of 'promt_bloc.dart';

@freezed
class PromtState with _$PromtState {
  const PromtState._();

  /// Idling state
  const factory PromtState.idle({
    required final PromtEntity data,
    required final List<String> suggestions,
    @Default('Idle') final String message,
  }) = IdlePromtState;

  /// Processing
  const factory PromtState.processing({
    required final PromtEntity data,
    required final List<String> suggestions,
    @Default('Processing') final String message,
  }) = ProcessingPromtState;

  /// Successful
  const factory PromtState.successful({
    required final PromtEntity data,
    required final List<String> suggestions,
    @Default('Successful') final String message,
  }) = SuccessfulPromtState;

  /// An error has occurred
  const factory PromtState.error({
    required final PromtEntity data,
    required final List<String> suggestions,
    @Default('An error has occurred') final String message,
  }) = ErrorPromtState;

  // ignore: prefer_constructors_over_static_methods
  static PromtState initial([List<String> suggestions = const <String>[]]) =>
      PromtState.idle(data: const PromtEntity.empty(), suggestions: suggestions);

  /// If an error has occurred
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);
}
