import 'package:meta/meta.dart';

import '../../feature/promt/bloc/promt_bloc.dart';
import '../../feature/promt/data/promt_network_provider.dart';
import '../../feature/promt/data/promt_repository.dart';
import '../constant/environment.dart';
import '../data/rest_client.dart';

@sealed
abstract class Dependencies {
  Dependencies._();

  static Dependencies get instance => _instance;
  static final Dependencies _instance = _DependenciesProduction();

  abstract final PromtBLoC promtBLoC;
}

class _DependenciesProduction implements Dependencies {
  late final RestClient _httpClient = RestClient(uri: kEndpoint);

  late final IPromtNetworkDataProvider _networkDataProvider = PromtNetworkDataProviderImpl(client: _httpClient);

  late final IPromtRepository _promtRepository = PromtRepositoryImpl(networkDataProvider: _networkDataProvider);

  @override
  late final PromtBLoC promtBLoC = PromtBLoC(repository: _promtRepository);
}
