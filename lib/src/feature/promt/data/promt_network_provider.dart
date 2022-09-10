import '../../../common/data/rest_client.dart';

abstract class IPromtNetworkDataProvider {
  Future<String> beginGeneration({required String promt});
  Future<List<Uri>> fetchByTaskId(String taskId);
}

class PromtNetworkDataProviderImpl implements IPromtNetworkDataProvider {
  PromtNetworkDataProviderImpl({required RestClient client}) : _client = client;

  final RestClient _client;

  @override
  Future<String> beginGeneration({required String promt}) async {
    //_client.post(url);
    await Future<void>.delayed(const Duration(seconds: 5));
    // TODO: implement beginGeneration
    throw UnimplementedError();
  }

  @override
  Future<List<Uri>> fetchByTaskId(String taskId) async {
    await Future<void>.delayed(const Duration(seconds: 5));
    // TODO: implement fetchByTaskId
    throw UnimplementedError();
  }
}
