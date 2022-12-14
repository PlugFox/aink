import 'package:flutter/material.dart';

import 'app.dart';

/// {@template app_error}
/// AppError widget
/// {@endtemplate}
class AppError extends App {
  /// {@macro app_error}
  const AppError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                'Something went wrong',
                textScaleFactor: 2,
              ),
            ),
          ),
        ),
      );
}
