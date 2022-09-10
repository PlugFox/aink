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
        RestClient.buildUri(Uri.parse('https://api.domain.tld'), 'mobile/v1/endpoint/'),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld/mobile/v1/endpoint'), ''),
        equals(expectedPath),
      );
      expect(
        RestClient.buildUri(Uri.parse('https://api.domain.tld?param1=value1'), 'mobile/v1/endpoint?param2=value2'),
        equals(expectedPath.replace(query: 'param1=value1&param2=value2')),
      );
    });
  });
}
