import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  String origin = "https://xyz2.sfo2.digitaloceanspaces.com";
  Endpoint e;
  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    e = await client.endpoint.create(origin);
    expect(e, isNotNull);
  });

  tearDownAll(() async {
    await client.endpoint.delete(e.id);
  });

  group('Endpoints', () {
    test('GetEndpoint', () async {
      Endpoint _ = await client.endpoint.get(e.id);
      expect(_, equals(e));
    });
    test('UpdateEndpoint', () async {
      Endpoint _ = await client.endpoint.update(e.id, 7200);
      expect(_.ttl, equals(7200));

      e = await client.endpoint.get(_.id);
      expect(e.ttl, equals(_.ttl));
    });
    test('ListEndpoints', () async {
      Endpoints _ = await client.endpoint.list();

      expect(_, isNotNull);
    });
  });
}
