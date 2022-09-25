import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../common/util/error_util.dart';
import '../../../common/util/timeouts.dart';
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
        restore: _restore,
        generate: _generate,
      );

  Stream<PromtState> _restore(RestorePromtEvent event) async* {
    try {
      final data = _repository.getPromt();
      if (data == null) return;
      yield PromtState.processing(data: data);
      final taskId = data.task;
      if (taskId == null) return;
      final images = await _repository.fetchByTaskId(taskId).value;
      yield PromtState.successful(data: state.data.copyWith(newImages: images));
    } on Object catch (error) {
      yield PromtState.error(
        data: const PromtEntity.empty(),
        message: ErrorUtil.formatMessage(error),
      );
      rethrow;
    } finally {
      _repository.clearPromt().ignore();
      yield PromtState.idle(data: state.data);
    }
  }

  Stream<PromtState> _generate(GeneratePromtEvent event) async* {
    try {
      final data = _repository.getPromt() ?? PromtEntity.create(event.promt);
      final promt = data.promt ?? '';
      if (promt.isEmpty) return;
      yield PromtState.processing(data: data);
      final taskId = state.data.task ?? await _repository.generateImages(promt: promt).logicTimeout();
      yield PromtState.processing(data: state.data.copyWith(newTask: taskId));
      await _repository.setPromt(state.data).logicTimeout();
      final images = await _repository.fetchByTaskId(taskId).value;
      yield PromtState.successful(data: state.data.copyWith(newImages: images));
    } on Object catch (error) {
      yield PromtState.error(
        data: const PromtEntity.empty(),
        message: ErrorUtil.formatMessage(error),
      );
      rethrow;
    } finally {
      _repository.clearPromt().ignore();
      yield PromtState.idle(data: state.data);
    }
  }
}
