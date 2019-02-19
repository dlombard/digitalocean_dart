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

  group('Account', () {
    test('getAccount', () async {
      expect(await client.account.get(), isNotNull);
    });
  });
}
