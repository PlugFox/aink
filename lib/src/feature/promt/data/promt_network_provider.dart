import 'package:http/http.dart' as http;

abstract class IPromtNetworkDataProvider {
  Future<String> beginGeneration({required String promt});
  Future<List<Uri>> fetchByTaskId(String taskId);
}

class PromtNetworkDataProviderImpl implements IPromtNetworkDataProvider {
  PromtNetworkDataProviderImpl({required http.Client client}) : _client = client;

  final http.Client _client;

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
