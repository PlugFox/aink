import 'package:meta/meta.dart';

@immutable
class GeneratedImage {
  const GeneratedImage({
    required this.uuid,
    required this.url,
    required this.type,
    this.blurhash,
  });

  final String uuid;
  final Uri url;
  final String type;
  final String? blurhash;

  factory GeneratedImage.fromJson(Map<String, Object?> json) => GeneratedImage(
        uuid: json['uuid']! as String,
        url: Uri.parse(json['url']! as String),
        type: json['type']! as String,
        blurhash: json['blurhash'] as String?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'uuid': uuid,
        'url': url.toString(),
        'type': type,
        'blurhash': blurhash,
      };

  GeneratedImage copyWith({
    String? newUuid,
    Uri? newUrl,
    String? newType,
    String? newBlurhash,
  }) =>
      GeneratedImage(
        uuid: newUuid ?? uuid,
        url: newUrl ?? url,
        type: newType ?? type,
        blurhash: newBlurhash ?? blurhash,
      );

  @override
  int get hashCode => uuid.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GeneratedImage && uuid == other.uuid;

  @override
  String toString() => url.toString();
}
