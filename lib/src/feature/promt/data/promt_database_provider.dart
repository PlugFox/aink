import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/promt_entity.dart';

abstract class IPromtDatabaseProvider {
  PromtEntity? getPromt();
  Future<void> setPromt(PromtEntity promt);
  Future<void> clearPromt();
  Future<void> addSuggestion(String promt);
  List<String> getSuggestions();
}

class PromtDatabaseProviderImpl implements IPromtDatabaseProvider {
  PromtDatabaseProviderImpl({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  static const String _promtCurrentKey = 'promt-current';
  static const String _promtSuggestionsKey = 'promt-suggestions';
  static const int _maxPromtSuggestionsKey = 25;

  final SharedPreferences _sharedPreferences;

  @override
  PromtEntity? getPromt() {
    final json = _sharedPreferences.getString(_promtCurrentKey);
    if (json == null) return null;
    return PromtEntity.fromJson(jsonDecode(json) as Map<String, Object?>);
  }

  @override
  Future<void> setPromt(PromtEntity promt) =>
      _sharedPreferences.setString(_promtCurrentKey, jsonEncode(promt.toJson()));

  @override
  Future<void> clearPromt() => _sharedPreferences.remove(_promtCurrentKey);

  @override
  Future<void> addSuggestion(String promt) {
    if (promt.length < 3) return Future<void>.value();
    final list = getSuggestions()..remove(promt);
    return _sharedPreferences.setStringList(_promtSuggestionsKey, <String>[
      promt,
      ...list.take(_maxPromtSuggestionsKey - 1),
    ]);
  }

  @override
  List<String> getSuggestions() =>
      _sharedPreferences.getStringList(_promtSuggestionsKey)?.take(_maxPromtSuggestionsKey).toList() ?? <String>[];
}
