import 'package:meta/meta.dart';

import 'generated_image.dart';

@immutable
class PromtEntity {
  const PromtEntity({
    this.promt,
    this.task,
    this.images,
  });

  const PromtEntity.empty()
      : promt = null,
        task = null,
        images = null;

  const PromtEntity.create(String newPromt)
      : promt = newPromt,
        task = null,
        images = null;

  final String? promt;
  final String? task;
  final List<GeneratedImage>? images;

  PromtEntity copyWith({
    String? newPromt,
    String? newTask,
    List<GeneratedImage>? newImages,
  }) =>
      PromtEntity(
        promt: newPromt ?? promt,
        task: newTask ?? task,
        images: newImages ?? images,
      );
}
