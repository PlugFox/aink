import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../common/util/analytics.dart';
import '../../../common/util/error_util.dart';
import '../../../common/util/timeouts.dart';
import '../data/promt_repository.dart';
import '../model/generated_image.dart';
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
        focus: _focus,
      );

  Stream<PromtState> _restore(_RestorePromtEvent event) async* {
    try {
      final data = _repository.getPromt();
      if (data == null) return;
      yield PromtState.processing(data: data);
      final taskId = data.task;
      if (taskId == null) return;
      final images = await _repository.fetchByTaskId(taskId).value;
      yield PromtState.successful(data: state.data.copyWith(newImages: images));
      Analytics.logGenerateImagesComplete();
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

  Stream<PromtState> _generate(_GeneratePromtEvent event) async* {
    try {
      final prevPromt = _repository.getPromt();
      final PromtEntity data;
      if (prevPromt != null) {
        data = prevPromt;
      } else {
        data = PromtEntity.create(event.promt);
        Analytics.logGenerateImagesBegin();
      }
      final promt = data.promt ?? '';
      if (promt.isEmpty) return;
      yield PromtState.processing(data: data);
      final taskId = state.data.task ?? await _repository.generateImages(promt: promt).logicTimeout();
      yield PromtState.processing(data: state.data.copyWith(newTask: taskId));
      await _repository.setPromt(state.data).logicTimeout();
      final images = await _repository.fetchByTaskId(taskId).value;
      yield PromtState.successful(data: state.data.copyWith(newImages: images));
      Analytics.logGenerateImagesComplete();
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

  Stream<PromtState> _focus(_FocusPromtEvent event) async* {
    var newData = state.data;
    try {
      final index = event.index;
      final images = state.data.images ?? <GeneratedImage>[];
      if (index < 1 || images.isEmpty || index >= images.length) return;
      newData = state.data.copyWith(
        newImages: <GeneratedImage>[
          images[index],
          ...images.skip(1),
        ]..[index] = images.first,
      );
    } on Object catch (error) {
      yield PromtState.error(
        data: const PromtEntity.empty(),
        message: ErrorUtil.formatMessage(error),
      );
      rethrow;
    } finally {
      yield PromtState.idle(data: newData);
    }
  }
}
