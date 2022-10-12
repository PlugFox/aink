import 'package:async/async.dart';

import '../model/generated_image.dart';
import '../model/promt_entity.dart';
import 'promt_database_provider.dart';
import 'promt_network_provider.dart';

abstract class IPromtRepository {
  PromtEntity? getPromt();
  Future<void> setPromt(PromtEntity promt);
  Future<String> generateImages({required String promt});
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(String taskId);
  Future<void> clearPromt();
  Future<void> addSuggestion(String promt);
  List<String> getSuggestions();
}

class PromtRepositoryImpl implements IPromtRepository {
  PromtRepositoryImpl({
    required IPromtDatabaseProvider databaseProvider,
    required IPromtNetworkDataProvider networkDataProvider,
  })  : _databaseProvider = databaseProvider,
        _networkDataProvider = networkDataProvider;

  final IPromtDatabaseProvider _databaseProvider;
  final IPromtNetworkDataProvider _networkDataProvider;

  @override
  PromtEntity? getPromt() => _databaseProvider.getPromt();

  @override
  Future<void> setPromt(PromtEntity promt) => _databaseProvider.setPromt(promt);

  @override
  Future<String> generateImages({required String promt}) => _networkDataProvider.generateImages(promt: promt);

  @override
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(String taskId) => _networkDataProvider.fetchByTaskId(taskId);

  @override
  Future<void> clearPromt() => _databaseProvider.clearPromt();

  @override
  Future<void> addSuggestion(String promt) => _databaseProvider.addSuggestion(promt);

  @override
  List<String> getSuggestions() => _databaseProvider.getSuggestions();
}
