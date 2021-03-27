import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

//import '../lib/src/models/listOptions.dart';

//import '../lib/do_dart.dart';

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
      print(_.links.toJson());
      expect(_, isNotNull);
    });
    test('ListDistribution', () async {
      Images _ = await client.image.listDistributionImages();
      print(_.links.pages.toJson());
      expect(_, isNotNull);
    });
    test('ListApplication', () async {
      Images _ = await client.image.listApplicationImages();
      expect(_, isNotNull);
    });
  });
}
