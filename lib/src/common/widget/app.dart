import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../localization/localization.dart';
import 'wheel.dart';

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: '[AI]nk',
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        theme: ui.window.platformBrightness == ui.Brightness.dark ? ThemeData.dark() : ThemeData.light(),
        localizationsDelegates: const <LocalizationsDelegate<Object?>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          Localization.delegate,
        ],
        supportedLocales: Localization.supportedLocales,
        /* home: Scaffold(
          appBar: AppBar(
            title: const Text('[AI]nk'),
          ),
          body: const Placeholder(),
        ), */
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(child: Wheel()),
        ),
        /* builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Banner(
            message: 'PREVIEW',
            location: BannerLocation.topEnd,
            child: child,
          ),
        ), */
      );
}
