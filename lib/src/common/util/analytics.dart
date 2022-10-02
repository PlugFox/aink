import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart' show Orientation;
import 'package:meta/meta.dart';
import 'package:platform_info/platform_info.dart';

import '../../feature/authentication/model/user_entity.dart';
import '../constant/pubspec.yaml.g.dart' as pubspec;
import 'screen_util.dart';

@sealed
abstract class Analytics {
  Analytics._();

  static Future<bool> isSupported() => FirebaseAnalytics.instance.isSupported().catchError((Object _) => false);

  static void logEvent(String name, [Map<String, Object?>? parameters]) =>
      FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters).ignore();

  static void logAppOpen() => FirebaseAnalytics.instance.logAppOpen().ignore();

  static void logLogin(AuthenticatedUser user) => Stream<void>.fromFutures(<Future<void>>[
        FirebaseAnalytics.instance.setUserId(id: user.uid),
        FirebaseAnalytics.instance.setUserProperty(name: 'name', value: user.name),
        FirebaseAnalytics.instance.setUserProperty(name: 'email', value: user.email),
        if (user.providers.isNotEmpty)
          FirebaseAnalytics.instance.setUserProperty(name: 'provider', value: user.providers.first),
        FirebaseAnalytics.instance.logLogin(loginMethod: user.providers.firstOrNull),
      ]).drain<void>().ignore();

  static void logGenerateImagesBegin() => logEvent('generate_images_begin');

  static void logGenerateImagesComplete() => logEvent('generate_images_complete');

  static void logSignUp({required String signUpMethod}) =>
      FirebaseAnalytics.instance.logSignUp(signUpMethod: signUpMethod).ignore();

  static void logInitialized({final int? elapsedMilliseconds}) {
    final screenSize = ScreenUtil.screenSize();
    final orientation = ScreenUtil.orientation() == Orientation.landscape ? 'landscape' : 'portrait';
    logEvent('initialized', <String, Object?>{
      if (elapsedMilliseconds != null) 'duration': elapsedMilliseconds,
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
    });
  }

  static void logScreen({required String screenClass, required String screenName}) =>
      Stream<void>.fromFutures(<Future<void>>[
        FirebaseAnalytics.instance.logScreenView(screenClass: screenClass, screenName: screenName),
        FirebaseAnalytics.instance.setCurrentScreen(screenClassOverride: screenClass, screenName: screenName),
      ]).drain<void>().ignore();

  static void logScreenScope(String screenName) => logScreen(screenClass: 'Scope', screenName: screenName);

  /*
  FirebaseAnalytics.instance.logSearch(searchTerm: searchTerm);
  FirebaseAnalytics.instance.logSelectContent(contentType: contentType, itemId: itemId);
  FirebaseAnalytics.instance.logSelectItem();
  FirebaseAnalytics.instance.logShare();
  FirebaseAnalytics.instance.logTutorialBegin();
  FirebaseAnalytics.instance.logTutorialComplete();
  FirebaseAnalytics.instance.logUnlockAchievement(id: id)
  FirebaseAnalytics.instance.logViewItem()
  FirebaseAnalytics.instance.logViewItemList()
  FirebaseAnalytics.instance.logViewSearchResults(searchTerm: searchTerm);
  */
}
