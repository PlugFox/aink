import 'promt_network_provider.dart';

abstract class IPromtRepository {
  Future<String> beginGeneration({required String promt});
  Future<List<Uri>> fetchByTaskId(String taskId, {bool loop = true});
}

class PromtRepositoryImpl implements IPromtRepository {
  PromtRepositoryImpl({required IPromtNetworkDataProvider networkDataProvider})
      : _networkDataProvider = networkDataProvider;

  final IPromtNetworkDataProvider _networkDataProvider;

  @override
  Future<String> beginGeneration({required String promt}) => _networkDataProvider.beginGeneration(promt: promt);

  @override
  Future<List<Uri>> fetchByTaskId(String taskId, {bool loop = true}) async {
    await _networkDataProvider.fetchByTaskId(taskId);
    return <Uri>[];
  }
}
