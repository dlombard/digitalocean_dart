import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars = Platform.environment;

  final Client client = Client(envVars['DO_KEY']);
  test('Actions', () async {
    try {
      Actions as =
          await client.action.list(listOptions: ListOptions(2, perPage: 5));
      for (Action a in as.actions) {
        print(a.toJson());
      }
      print(as.links.toJson());
      print(as.meta.toJson());
      print(as.getCount());
    } catch (e) {
      print(e.toString());
    }
  });

  test('blockstorage ', () async {
    try {
      BlockStorageCreateRequest bscr =
          BlockStorageCreateRequest(1, "io", "tor1");
      BlockStorage bs = await client.blockStorage.create(bscr);
      expect(bs, isNotNull);
      BlockStorage bs1 = await client.blockStorage.get(bs.id);
      expect(bs1, equals(bs));

      Snapshots snaps = await client.blockStorage.listSnapshots(bs.id);
      expect(snaps, isNotNull);
      await client.blockStorage.delete(bs.id);
    } catch (e) {
      print(e.toString());
    }
  });
}
