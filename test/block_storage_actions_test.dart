import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform, sleep;

void main() {
  Map<String, String> envVars;
  Client client;
  String bsId;
  String name = 'doDartTestVol__';
  int dropletId = 174321945;

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    BlockStorageCreateRequest bscr = BlockStorageCreateRequest(1, name, 'nyc3');
    BlockStorage bs = await client.blockStorage.create(bscr);
    expect(bs, isNotNull);
    bsId = bs.id;
  });

  tearDownAll(() async {
    await client.blockStorage.delete(bsId);
  });

  group('BlockStorageAction', () {
    test('Attach', () async {
      Action action = await client.blockStorageAction.attach(bsId, dropletId);
      while (action.status != "completed") {
        print(action.status);
        sleep(Duration(milliseconds: 5000));
        action = await client.action.get(action.id);
      }
      expect(action, isNotNull);
    });
    test('Detach', () async {
      Action action = await client.blockStorageAction.detach(bsId, dropletId);
      expect(action, isNotNull);
    });
    test('Resize', () async {
      Action action = await client.blockStorageAction.resize(bsId, 2);
      expect(action, isNotNull);
    });
    test('List', () async {
      Actions actions = await client.blockStorageAction.list(bsId);
      expect(actions, isNotNull);
    });
  });
}
