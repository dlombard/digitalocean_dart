import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

//import '../lib/src/models/listOptions.dart';

//import '../lib/do_dart.dart';

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);

  tearDownAll(() async {});

  group('Images', () {
    test('List', () async {
      Images _ = await client.image.list();

      expect(_, isNotNull);
    });
    test('ListDistribution', () async {
      Images _ = await client.image.listDistributionImages();
      print(_.links!.pages!.toJson());
      expect(_, isNotNull);
    });
    test('ListApplication', () async {
      Images _ = await client.image.listApplicationImages();
      expect(_, isNotNull);
    });
  });
}
