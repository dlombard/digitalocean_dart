import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  String bsId;
  String name = 'doDartTestVol1';

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    BlockStorageCreateRequest bscr = BlockStorageCreateRequest(1, name, 'nyc3');
    BlockStorage bs = await client.blockStorage.create(bscr);
    expect(bs, isNotNull);
    print(bs.toJson());
    bsId = bs.id;
  });

  tearDownAll(() async {
    await client.blockStorage.delete(bsId);
    //add functionality to delete snapshot
  });

  group('BlockStorage', () {
    test('ListVolumes', () async {
      BlockStorages bss = await client.blockStorage.list();
      expect(bss, isNotNull);
    });
    test('GetStorage', () async {
      BlockStorage bs = await client.blockStorage.get(bsId);
      expect(bs, isNotNull);
      expect(bs.id, equals(bsId));
      expect(bs.name, equals(name));
    });
    test('GetStorageWithFakeId', () async {
      try {
        await client.blockStorage.get('bsId');
      } on DigitalOceanException catch (doE) {
        expect(doE.id, equals('not_found'));
        expect(doE.statusCode, equals(404));
      }
    });
    test('ListSnapshots', () async {
      Snapshots snaps = await client.blockStorage.listSnapshots(bsId);
      expect(snaps, isNotNull);
    });
    test('CreateSnapshots', () async {
      Snapshot snap = await client.blockStorage.createSnapshot(bsId, 'Nsnap');
      expect(snap, isNotNull);
    });
  });
}
