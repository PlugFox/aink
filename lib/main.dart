import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:l/l.dart';
import 'package:stream_bloc/stream_bloc.dart' as stream_bloc;

import 'src/common/bloc/app_bloc_observer.dart';
import 'src/common/initialization/initialization.dart';
import 'src/common/util/error_util.dart';
import 'src/common/widget/app.dart';
import 'src/common/widget/app_error.dart';

void main() => runZonedGuarded<void>(
      () => l.capture<void>(
        () async {
          try {
            await initializeApp();
          } on Object catch (error, stackTrace) {
            ErrorUtil.logError(error, stackTrace).ignore();
            runApp(const AppError());
            return;
          }
          stream_bloc.StreamBlocObserver.config = stream_bloc.StreamBlocObserverConfig(
            observer: AppBLoCObserver(),
            prioritizedLocation: stream_bloc.StreamBlocObserverLocation.static,
            shouldFallback: false,
          );
          runApp(const App());
        },
        const LogOptions(
          handlePrint: true,
          outputInRelease: true,
          printColors: true,
        ),
      ),
      l.e,
    );
