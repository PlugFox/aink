import 'package:async/async.dart';

import '../model/generated_image.dart';
import 'promt_network_provider.dart';

abstract class IPromtRepository {
  Future<String> generateImages({required String promt});
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(String taskId, {bool loop = true});
}

class PromtRepositoryImpl implements IPromtRepository {
  PromtRepositoryImpl({required IPromtNetworkDataProvider networkDataProvider})
      : _networkDataProvider = networkDataProvider;

  final IPromtNetworkDataProvider _networkDataProvider;

  @override
  Future<String> generateImages({required String promt}) => _networkDataProvider.generateImages(promt: promt);

  @override
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(String taskId, {bool loop = true}) =>
      _networkDataProvider.fetchByTaskId(taskId);
}
