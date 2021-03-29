import 'package:random_string/random_string.dart';
import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform, sleep;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);
  String? bsId;
  String name = randomAlpha(12).toLowerCase();
  int dropletId = 174321945;

  setUpAll(() async {
    print(name);
    BlockStorageCreateRequest bscr = BlockStorageCreateRequest(1, name, 'nyc3');
    BlockStorage bs = await client.blockStorage.create(bscr);
    expect(bs, isNotNull);
    bsId = bs.id;
  });

  tearDownAll(() async {
    if (bsId != null) {
      await client.blockStorage.delete(bsId!);
    }
  });

  group('BlockStorageAction', () {
    test('Attach', () async {
      Action action = await client.blockStorageAction.attach(bsId!, dropletId);
      while (action.status != "completed") {
        print(action.status);
        sleep(Duration(milliseconds: 5000));
        action = await client.action.get(action.id);
      }
      expect(action, isNotNull);
    });
    test('Detach', () async {
      Action action = await client.blockStorageAction.detach(bsId!, dropletId);
      expect(action, isNotNull);
    });
    test('Resize', () async {
      Action action = await client.blockStorageAction.resize(bsId!, 2);
      expect(action, isNotNull);
    });
    test('List', () async {
      Actions actions = await client.blockStorageAction.list(bsId!);
      expect(actions, isNotNull);
    });
  });
}
