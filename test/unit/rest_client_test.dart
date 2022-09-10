import 'package:aink/src/common/data/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('rest_client', () {
    test('build_url', () {
      final expectedPath = Uri.parse('https://api.domain.tld/mobile/v1/endpoint');
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld/mobile/v1'), 'endpoint'),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld/another/'), '/mobile/v1/endpoint'),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld/mobile/'), 'v1/endpoint'),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld//'), '/mobile/v1/endpoint/'),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld/mobile/v1/endpoint'), ''),
        equals(expectedPath),
      );
    });
  });
}
