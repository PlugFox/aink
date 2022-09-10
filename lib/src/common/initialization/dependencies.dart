import 'package:http/http.dart' as http;

import '../../feature/promt/data/promt_network_provider.dart';
import '../../feature/promt/data/promt_repository.dart';
import '../data/http_client.dart';

abstract class Dependencies {
  Dependencies._();

  static final http.Client _httpClient = HttpClient();

  static final IPromtNetworkDataProvider _networkDataProvider = PromtNetworkDataProviderImpl(client: _httpClient);

  static final IPromtRepository promtRepository = PromtRepositoryImpl(networkDataProvider: _networkDataProvider);
}
