import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../feature/authentication/widget/authentication_scope.dart';
import '../../feature/settings/bloc/settings_bloc.dart';
import '../initialization/dependencies.dart';
import '../localization/localization.dart';
import '../router/router.dart';

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final SettingsBLoC _settingsBLoC = Dependencies.instance.settingsBLoC;
  late final StreamSubscription<SettingsState> _settingsSubscription;

  final AppRouter _router = AppRouter();

  @override
  void initState() {
    super.initState();
    _settingsSubscription = _settingsBLoC.stream.distinct().listen(
          (state) => setState(() {}),
        );
  }

  @override
  void dispose() {
    _settingsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'NeuroStocker',
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        theme: _settingsBLoC.state.data.theme?.themeData ??
            (ui.window.platformBrightness == ui.Brightness.dark ? ThemeData.dark() : ThemeData.light()),
        localizationsDelegates: const <LocalizationsDelegate<Object?>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          Localization.delegate,
        ],
        supportedLocales: Localization.supportedLocales,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        //routeInformationProvider: ,
        /* navigatorObservers: <NavigatorObserver>[
          _routeObserver,
        ],
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(child: WheelScreen()),
        ), */
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Banner(
            message: 'PREVIEW',
            location: BannerLocation.topEnd,
            child: AuthenticationScope(
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        ),
      );
}
