import 'dart:async';

//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:meta/meta.dart';

import '../exception/authentication_exception.dart';
import '../exception/network_exception.dart';

@sealed
abstract class ErrorUtil {
  ErrorUtil._();

  static Future<void> logError(
    Object exception,
    StackTrace stackTrace, {
    String? hint,
    bool fatal = false,
  }) async {
    try {
      if (exception is String) {
        return await logMessage(
          exception,
          stackTrace,
          hint: hint,
          warning: true,
        );
      }
      //await Sentry.captureException(exception, stackTrace: stackTrace, hint: hint);
      //await FirebaseCrashlytics.instance
      //    .recordError(exception, stackTrace ?? StackTrace.current, reason: hint, fatal: fatal);
      l.e(exception, stackTrace);
    } on Object catch (error, stackTrace) {
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logError',
        stackTrace,
      );
    }
  }

  static Future<void> logMessage(
    String message,
    StackTrace stackTrace, {
    String? hint,
    bool warning = false,
    List<String>? params,
  }) async {
    try {
      /* 
      await Sentry.captureMessage(
        message,
        level: warning ? SentryLevel.warning : SentryLevel.info,
        hint: hint,
        params: <String>[
          ...?params,
          if (stackTrace != null) 'StackTrace: $stackTrace',
        ],
      );
      */
      /* if (warning || stackTrace != null) {
        await FirebaseCrashlytics.instance.recordError(message, stackTrace ?? StackTrace.current);
      } else {
        await FirebaseCrashlytics.instance.log('$message${hint != null ? '\r\n$hint' : ''}');
      } */
      l.w(message, stackTrace);
    } on Object catch (error, stackTrace) {
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logMessage',
        stackTrace,
      );
    }
  }

  @alwaysThrows
  static Never throwWithStackTrace(Object error, StackTrace stackTrace) => Error.throwWithStackTrace(error, stackTrace);

  static String formatMessage(
    Object error, [
    String fallback = 'An error has occurred',
  ]) {
    if (error is String) {
      return error;
    } else if (error is ServerInternalException) {
      return 'Server error';
    } else if (error is InternetException) {
      return 'Problem with internet connection';
    } else if (error is RestClientException) {
      return 'Request exception';
    } else if (error is FormatException) {
      return 'Invalid data format';
    } else if (error is TimeoutException) {
      return 'Timeout exceeded';
    } else if (error is UnimplementedError) {
      return 'Not implemented yet';
    } else if (error is UnsupportedError) {
      return 'Unsupported operation';
    } else if (error is AuthenticationException) {
      return 'Authentication error';
    } else {
      return fallback;
    }
  }

  static void showSnackBar(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
}
