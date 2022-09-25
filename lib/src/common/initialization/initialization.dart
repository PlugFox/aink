import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_info/platform_info.dart';

import '../constant/firebase_options.g.dart';
import '../constant/pubspec.yaml.g.dart' as pubspec;
import '../util/error_util.dart';
import '../util/screen_util.dart';
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
          FirebaseAnalytics.instance.logAppOpen().ignore();
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
          _logInitialized(elapsedMilliseconds: stopwatch.elapsedMilliseconds).ignore();
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

Future<void> _logInitialized({
  required final int elapsedMilliseconds,
}) {
  // Analytics
  final analytics = FirebaseAnalytics.instance;
  final screenSize = ScreenUtil.screenSize();
  final orientation = ScreenUtil.orientation() == Orientation.landscape ? 'landscape' : 'portrait';
  return analytics.logEvent(
    name: 'initialized',
    parameters: <String, Object?>{
      'duration': elapsedMilliseconds,
      'version': pubspec.version,
      'version_major': pubspec.major,
      'version_minor': pubspec.minor,
      'version_patch': pubspec.patch,
      'version_major_minor': pubspec.major + (pubspec.minor / 100),
      'screen_size': screenSize.representation,
      'screen_size_min': screenSize.min,
      'screen_size_max': screenSize.max,
      'orientation': orientation,
      'locale': Platform.I.locale,
      'mobile': Platform.I.isMobile,
      'desktop': Platform.I.isDesktop,
      'web': Platform.I.isWeb,
      'operating_system': Platform.I.operatingSystem.when<String>(
        android: () => 'Android',
        iOS: () => 'iOS',
        linux: () => 'Linux',
        macOS: () => 'macOS',
        windows: () => 'Windows',
        fuchsia: () => 'Fuchsia',
        unknown: () => 'Other',
      ),
      'user_agent': Platform.I.version,
    },
  );
}
