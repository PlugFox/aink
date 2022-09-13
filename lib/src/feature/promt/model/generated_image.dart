import 'package:meta/meta.dart';

@immutable
class GeneratedImage {
  const GeneratedImage({
    required this.uuid,
    required this.path,
    required this.type,
    this.blurhash,
  });

  final String uuid;
  final String path;
  final String type;
  final String? blurhash;

  factory GeneratedImage.fromJson(Map<String, Object?> json) => GeneratedImage(
        uuid: json['uuid']! as String,
        path: json['path']! as String,
        type: json['type']! as String,
        blurhash: json['blurhash'] as String?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'uuid': uuid,
        'path': path,
        'type': type,
        'blurhash': blurhash,
      };

  GeneratedImage copyWith({
    String? newUuid,
    String? newPath,
    String? newType,
    String? newBlurhash,
  }) =>
      GeneratedImage(
        uuid: newUuid ?? uuid,
        path: newPath ?? path,
        type: newType ?? type,
        blurhash: newBlurhash ?? blurhash,
      );

  @override
  int get hashCode => uuid.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GeneratedImage && uuid == other.uuid;
}
