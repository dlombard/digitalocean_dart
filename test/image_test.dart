import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
  });

  tearDownAll(() async {});

  group('Images', () {
    test('List', () async {
      Images _ = await client.image.list();
      expect(_, isNotNull);
    });
    test('ListDistribution', () async {
      Images _ = await client.image.listDistributionImages();
      expect(_, isNotNull);
    });
    test('ListApplication', () async {
      Images _ = await client.image.listApplicationImages();
      expect(_, isNotNull);
    });
  });
}
