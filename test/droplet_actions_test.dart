import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  int dropletId = 124122340;

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
  });

  tearDownAll(() async {});

  group('DropletActions', () {
    test('rename', () async {
      Action a = await client.dropletAction.rename(dropletId, "12345");
      expect(a.type, equals("rename"));
    });
    test('EnableIPv6', () async {
      Action a = await client.dropletAction.enableIPv6(dropletId);
      expect(a.type, equals("enable_ipv6"));
    });
    test('EnablePrivateNetworking', () async {
      Action a = await client.dropletAction.enablePrivateNetworking(dropletId);
      expect(a.type, equals("enable_private_networking"));
    });

    test('reboot', () async {
      Action a = await client.dropletAction.reboot(dropletId);
      expect(a.type, equals("reboot"));
    });
  });
}
