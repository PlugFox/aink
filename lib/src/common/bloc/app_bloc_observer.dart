import 'package:l/l.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../util/error_util.dart';

class AppBLoCObserver extends StreamBlocObserver {
  @override
  void onCreate(Closable closable) {
    super.onCreate(closable);
    l.v4('${closable.runtimeType}()');
  }

  @override
  void onEvent(BlocEventSink<Object?> eventSink, Object? event) {
    super.onEvent(eventSink, event);
    if (event == null) return;
    l.v5('${eventSink.runtimeType}.add(${event.runtimeType})');
  }

  @override
  void onError(ErrorSink errorSink, Object error, StackTrace stackTrace) {
    super.onError(errorSink, error, stackTrace);
    ErrorUtil.logError(
      error,
      stackTrace,
      hint: 'On BLoC "${errorSink.runtimeType}" error',
    ).ignore();
  }

  @override
  void onTransition(BlocEventSink<Object?> bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final Object? event = transition.event;
    final Object? currentState = transition.currentState;
    final Object? nextState = transition.nextState;
    if (event == null || currentState == null || nextState == null) return;
    l.v6(
      '${bloc.runtimeType} ${event.runtimeType}: ${currentState.runtimeType}->${nextState.runtimeType}',
    );
  }

  @override
  void onClose(Closable closable) {
    super.onClose(closable);
    l.v4('${closable.runtimeType}()');
  }
}
