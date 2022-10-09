/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsFontGen {
  const $AssetsFontGen();

  /// File path: assets/font/Sofia-Regular.ttf
  String get sofiaRegular => 'assets/font/Sofia-Regular.ttf';

  /// List of all assets
  List<String> get values => [sofiaRegular];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/sunflower_512x512.jpg
  AssetGenImage get sunflower512x512 => const AssetGenImage('assets/image/sunflower_512x512.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [sunflower512x512];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/icon_alfa_512.png
  AssetGenImage get iconAlfa512 => const AssetGenImage('assets/logo/icon_alfa_512.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconAlfa512];
}

class Assets {
  Assets._();

  static const $AssetsFontGen font = $AssetsFontGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
