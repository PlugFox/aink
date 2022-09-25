import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/promt_entity.dart';

abstract class IPromtDatabaseProvider {
  PromtEntity? getPromt();
  Future<void> setPromt(PromtEntity promt);
  Future<void> clearPromt();
}

class PromtDatabaseProviderImpl implements IPromtDatabaseProvider {
  PromtDatabaseProviderImpl({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  static const String _promtKey = 'current-promt';

  final SharedPreferences _sharedPreferences;

  @override
  PromtEntity? getPromt() {
    final json = _sharedPreferences.getString(_promtKey);
    if (json == null) return null;
    return PromtEntity.fromJson(jsonDecode(json) as Map<String, Object?>);
  }

  @override
  Future<void> setPromt(PromtEntity promt) => _sharedPreferences.setString(_promtKey, jsonEncode(promt.toJson()));

  @override
  Future<void> clearPromt() => _sharedPreferences.remove(_promtKey);
}
