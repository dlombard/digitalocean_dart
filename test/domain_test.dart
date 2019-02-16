import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  String domain = "test_domain_dlo.com";
  Domain d;

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    d = await client.domain.create(domain);
    expect(d, isNotNull);
  });

  group('Domains', () {
    test('GetDomain', () async {
      Domain _ = await client.domain.get(domain);
      expect(_.name, equals(d.name));
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
