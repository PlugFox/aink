import '../../../common/data/rest_client.dart';

abstract class IPromtNetworkDataProvider {
  Future<String> beginGeneration({required String promt});
  Future<List<Uri>> fetchByTaskId(String taskId);
}

class PromtNetworkDataProviderImpl implements IPromtNetworkDataProvider {
  PromtNetworkDataProviderImpl({required RestClient client}) : _client = client;

  final RestClient _client;

  @override
  Future<String> beginGeneration({required String promt}) {
    //_client.post(url);
    // TODO: implement beginGeneration
    throw UnimplementedError();
  }

  @override
  Future<List<Uri>> fetchByTaskId(String taskId) {
    // TODO: implement fetchByTaskId
    throw UnimplementedError();
  }
}
