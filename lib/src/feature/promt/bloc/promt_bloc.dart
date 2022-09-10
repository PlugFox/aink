import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../common/util/error_util.dart';
import '../data/promt_repository.dart';
import '../model/promt_entity.dart';

part 'promt_bloc.freezed.dart';
part 'promt_event.dart';
part 'promt_state.dart';

class PromtBLoC extends StreamBloc<PromtEvent, PromtState> {
  PromtBLoC({required IPromtRepository repository})
      : _repository = repository,
        super(PromtState.initial());

  final IPromtRepository _repository;

  @override
  Stream<PromtState> mapEventToStates(PromtEvent event) => event.map<Stream<PromtState>>(
        generate: _generate,
      );

  Stream<PromtState> _generate(GeneratePromtEvent event) async* {
    try {
      if (event.promt.isEmpty) return;
      yield PromtState.processing(
        data: PromtEntity.create(event.promt),
      );
      final taskId = await _repository.beginGeneration(promt: event.promt);
      yield PromtState.processing(
        data: state.data.copyWith(newTask: taskId),
      );
      final images = await _repository.fetchByTaskId(taskId, loop: true);
      yield PromtState.successful(
        data: state.data.copyWith(
          newImages: images,
        ),
      );
    } on Object catch (error) {
      yield PromtState.error(
        data: const PromtEntity.empty(),
        message: ErrorUtil.formatMessage(error),
      );
      rethrow;
    } finally {
      yield PromtState.idle(
        data: state.data,
      );
    }
  }
}
