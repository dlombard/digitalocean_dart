import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);

  group('Account', () {
    test('getAccount', () async {
      expect(await client.account.get(), isNotNull);
    });
  });
}
