import 'dart:async' show FutureOr;

FutureOr<void> $downloadBytes(List<int> bytes, String filename) =>
    throw UnsupportedError('Cannot download files on this platform.');

Future<void> $downloadUrl(Uri url, String? filename, Map<String, String>? headers) =>
    throw UnsupportedError('Cannot download files on this platform.');
