import 'dart:async';
import 'dart:io' as io;

import 'package:collection/collection.dart';
import 'package:file_selector/file_selector.dart' as fs;
import 'package:path_provider/path_provider.dart' as pp;
//import 'package:image_gallery_saver/image_gallery_saver.dart' as igs;
import 'package:permission_handler/permission_handler.dart' as ph;

FutureOr<void> $downloadBytes(List<int> bytes, String filename) async {
  final statuses = await <ph.Permission>[
    ph.Permission.storage,
  ].request();

  if (statuses[ph.Permission.storage] != ph.PermissionStatus.granted) {
    throw UnsupportedError('Storage permission not granted.');
  }

  String? initialDirectory;
  if (io.Platform.isAndroid) {
    Future<io.Directory?> getDirectory(pp.StorageDirectory type) =>
        pp.getExternalStorageDirectories(type: type).then<io.Directory?>((value) => value?.firstOrNull);

    initialDirectory = await Stream<Future<io.Directory?> Function()>.fromIterable(<Future<io.Directory?> Function()>[
      () => getDirectory(pp.StorageDirectory.pictures),
      () => getDirectory(pp.StorageDirectory.dcim),
      () => getDirectory(pp.StorageDirectory.downloads),
      () => getDirectory(pp.StorageDirectory.documents),
      pp.getExternalStorageDirectory,
    ]).asyncMap<io.Directory?>((fn) => fn()).map<String?>((dir) => dir?.path).firstWhere((path) => path != null);
  } else if (io.Platform.isIOS) {
    initialDirectory = await pp.getApplicationDocumentsDirectory().then((dir) => dir.path);
  } else {
    throw UnimplementedError('Platform not supported.');
  }

  await fs.getSavePath(initialDirectory: initialDirectory, suggestedName: filename).then<void>((value) async {
    if (value == null) return;
    final file = io.File(value);
    await file.writeAsBytes(bytes);
  });
}

Future<void> $downloadUrl(Uri url, String? filename, Map<String, String>? headers) {
  final completer = Completer<void>();
  runZonedGuarded<void>(
    () {
      io.HttpClient().getUrl(url).then<io.HttpClientResponse>((request) {
        headers?.forEach(request.headers.add);
        return request.close();
      }).then<void>((response) {
        response.listen(
          (bytes) => $downloadBytes(bytes, filename ?? url.pathSegments.last),
          onDone: completer.complete,
          onError: completer.completeError,
        );
      }).catchError(completer.completeError);
    },
    completer.completeError,
  );

  return completer.future;
}
