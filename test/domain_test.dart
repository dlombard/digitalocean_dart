import 'package:random_string/random_string.dart';
import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);
  String domain = randomAlpha(12).toLowerCase() + '.com';
  Domain? d;

  setUpAll(() async {
    d = await client.domain.create(domain);
    expect(d, isNotNull);
  });

  group('Domains', () {
    test('GetDomain', () async {
      Domain _ = await client.domain.get(domain);
      expect(_.name, equals(d!.name));
    });
    test('ListEndpoints', () async {
      Domains _ = await client.domain.list();
      expect(_, isNotNull);
    });
    test('DeleteEndpoints', () async {
      await client.domain.delete(domain);
    });
  });
}
