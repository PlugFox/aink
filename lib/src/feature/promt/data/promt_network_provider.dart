import 'dart:async';
import 'dart:math' as math;

import 'package:async/async.dart';

import '../../../common/data/rest_client.dart';
import '../../../common/exception/network_exception.dart';
import '../model/generated_image.dart';

abstract class IPromtNetworkDataProvider {
  Future<String> generateImages({required String promt});
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(String taskId);
}

class PromtNetworkDataProviderImpl implements IPromtNetworkDataProvider {
  PromtNetworkDataProviderImpl({required RestClient client})
      : _client = client,
        _random = math.Random();

  final math.Random _random;
  final RestClient _client;

  @override
  Future<String> generateImages({required String promt}) => _client.post(
        path: 'generate_image',
        data: <String, Object?>{
          'prompt': promt,
          'generation_image_size': 'square',
          'image_generation_count': 4,
          'seed': _random.nextInt(10 << 24) + 1,
          //'generation_model': 'stable_diffusion',
          //'style': 'Painting',
          //'model_version': '1',
          //'opts': 'string',
        },
      ).then<String>((data) => (data['task']! as Map<String, Object?>)['task_id']!.toString());

  @override
  CancelableOperation<List<GeneratedImage>> fetchByTaskId(
    String taskId, [
    Duration duration = const Duration(seconds: 5),
  ]) {
    late final CancelableCompleter<List<GeneratedImage>> completer;
    final timer = Timer.periodic(duration, (timer) async {
      try {
        final data = await _client.get(path: 'generation_result_status/$taskId').timeout(duration);
        if (completer.isCompleted || completer.isCanceled) {
          timer.cancel();
          return;
        }
        switch (data['task_status'] as String?) {
          case 'RECEIVED':
          case 'STARTED':
            return;
          case 'SUCCESS':
            timer.cancel();
            completer.complete(
              (data['images']! as Iterable<Object?>)
                  .whereType<Map<String, Object?>>()
                  .map<GeneratedImage>(GeneratedImage.fromJson)
                  .toList(),
            );
            break;
          default:
            throw _FetchByTaskIdStatusException('Unknown task status: ${data['task_status']}');
        }
      } on Object catch (error, stackTrace) {
        timer.cancel();
        completer.completeError(error, stackTrace);
      }
    });
    return (completer = CancelableCompleter<List<GeneratedImage>>(onCancel: timer.cancel)).operation;
  }
}

class _FetchByTaskIdStatusException implements NetworkException {
  _FetchByTaskIdStatusException(this.message);

  final String message;

  @override
  String toString() => message;
}
