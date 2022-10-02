import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../constant/firebase_options.g.dart';
import '../util/analytics.dart';
import '../util/error_util.dart';
import 'dependencies.dart';
import 'platform/platform_initialization.dart';

Future<void>? _$initializeApp;
FutureOr<void> initializeApp({
  Future<void> Function()? onSuccess,
  Future<void> Function(Object error, StackTrace stackTrace)? onError,
}) =>
    _$initializeApp ??= Future<void>(() async {
      late final WidgetsBinding binding;
      final stopwatch = Stopwatch()..start();
      try {
        binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();
        {
          /* await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]); */
          await _initFirebase();
          await Dependencies.initialize();
          await _catchExceptions();
          platformInitialization().ignore();
          Analytics.logAppOpen();
        }
      } on Object catch (error, stackTrace) {
        onError?.call(error, stackTrace).ignore();
        // TODO: force log and send crashlytics exception
        rethrow;
      } finally {
        stopwatch.stop();
        onSuccess?.call().ignore();
        binding.addPostFrameCallback((_) {
          // Closes splash screen, and show the app layout.
          binding.allowFirstFrame();
          //final context = binding.renderViewElement;
          Analytics.logInitialized(elapsedMilliseconds: stopwatch.elapsedMilliseconds);
        });
      }
    });

Future<void> _initFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Object catch (error, stackTrace) {
    await ErrorUtil.logError(error, stackTrace);
    if (kDebugMode) rethrow;
  }
}

Future<void> _catchExceptions() async {
  try {
    PlatformDispatcher.instance.onError = (error, stackTrace) {
      ErrorUtil.logError(
        error,
        stackTrace,
        hint: 'TOP LEVEL EXCEPTION\r\n${Error.safeToString(error)}',
      ).ignore();
      return true;
    };

    //final sourceFlutterError = FlutterError.onError;
    //FlutterError.onError = (final details) {
    //  FirebaseCrashlytics.instance.recordFlutterError(details).ignore();
    //  //FlutterError.presentError(details);
    //  sourceFlutterError?.call(details);
    //};
  } on Object catch (error, stackTrace) {
    ErrorUtil.logError(error, stackTrace).ignore();
  }
}
