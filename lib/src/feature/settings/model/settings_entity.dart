import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

/// {@template settings_entity}
/// SettingsEntity entity
/// {@endtemplate}
@immutable
class SettingsEntity with Comparable<SettingsEntity> {
  /// {@macro settings_entity}
  SettingsEntity({
    this.theme,
    this.locale,
    DateTime? updated,
  }) : updated = updated ?? DateTime.now();

  final SettingsTheme? theme;

  final String? locale;

  final DateTime updated;

  factory SettingsEntity.fromJson(Map<String, Object?> json) {
    final updatedRaw = json['updated'] as String?;
    final updated = (updatedRaw != null ? DateTime.tryParse(updatedRaw) ?? DateTime.now() : DateTime.now()).toUtc();
    return SettingsEntity(
      theme: SettingsTheme.fromString(json['theme'] as String?),
      //locale: json['locale'] as String?,
      updated: updated,
    );
  }

  @useResult
  Map<String, Object?> toJson() => <String, Object?>{
        'theme': theme?.toString(),
        //'locale': locale?.toString(),
        'updated': updated.toUtc().toIso8601String(),
      };

  @override
  int compareTo(SettingsEntity other) => updated.compareTo(other.updated);

  @override
  int get hashCode => theme.hashCode ^ locale.hashCode;

  SettingsEntity copyWith({
    SettingsTheme? newTheme,
    //String? newLocale,
  }) =>
      SettingsEntity(
        theme: newTheme ?? theme,
        //locale: newLocale ?? locale,
        updated: DateTime.now().toUtc(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsEntity && runtimeType == other.runtimeType && theme == other.theme && locale == other.locale);

  @override
  String toString() => 'SettingsEntity#$hashCode';
}

enum SettingsTheme {
  light,
  dark;

  const SettingsTheme();

  static SettingsTheme fromString(String? value) {
    switch (value) {
      case 'light':
        return light;
      case 'dark':
        return dark;
      default:
        return ui.window.platformBrightness == ui.Brightness.dark ? dark : light;
    }
  }

  ThemeData get themeData {
    switch (this) {
      case light:
        return ThemeData.light();
      case dark:
        return ThemeData.dark();
    }
  }

  @override
  String toString() => name;
}
