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

  bool get hasPromt => promt?.isNotEmpty ?? false;

  factory PromtEntity.fromJson(Map<String, Object?> json) => PromtEntity(
        promt: json['promt'] as String?,
        task: json['task'] as String?,
        images: (json['images'] as Iterable<Object?>?)
            ?.whereType<Map<String, Object?>>()
            .map<GeneratedImage>(GeneratedImage.fromJson)
            .toList(growable: false),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'promt': promt,
        'task': task,
        'images': images?.map<Map<String, Object?>>((e) => e.toJson()).toList(growable: false),
      };

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
