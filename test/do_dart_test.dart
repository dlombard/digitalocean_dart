import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform, sleep;

void main() {
  Map<String, String> envVars;
  Client client;
  Droplet d;
  Droplets ds;
  String bsId;
  String volumeName = 'doDartTestVol1';
  Snapshot snap;
/*
 This test creates a droplet and a volume. 
 Once this is done, we test multiple api endpoints
*/
  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);

    // Create the droplet(s)
    DropletCreateRequest dcr = DropletCreateRequest(
        'test-droplet', 'nyc3', 's-1vcpu-1gb', 53893572,
        ssh_keys: [1551138]);
    d = await client.droplet.create(dcr);
    expect(d, isNotNull);

    /* DropletCreateManyRequest dcmr = DropletCreateManyRequest(
        ["many-1", "many-2", "many-3"], 'nyc3', 's-1vcpu-1gb', 53893572,
        tags: ["test-dart"], ssh_keys: [1551138]);
    ds = await client.droplet.createMany(dcmr);

    expect(ds, isNotNull);
*/
    print("BLOCKSTORAGE");
    // Create a volume
    BlockStorageCreateRequest bscr =
        BlockStorageCreateRequest(1, volumeName, 'nyc3');
    BlockStorage bs = await client.blockStorage.create(bscr);
    expect(bs, isNotNull);
    bsId = bs.id;
  });

  tearDownAll(() async {
    // Delete droplets
    await client.droplet.delete(d.id);
    if (ds != null) {
      for (var droplet in ds.droplets) {
        await client.droplet.delete(droplet.id);
      }
    }

    if (bsId != null) await client.blockStorage.delete(bsId);
  });

  group('Droplets', () {
    test('GetDroplet', () async {
      Droplet droplet = await client.droplet.get(d.id);
      expect(droplet, isNotNull);
      expect(droplet.id, equals(d.id));
    });
    test('List all', () async {
      Droplets droplets = await client.droplet.list();
      expect(droplets.getCount(), isPositive);
    });
    test('List by tag', () async {
      Droplets droplets = await client.droplet.listByTag("test-dart");
      expect(droplets.getCount(), isNotNull);
    });
    test('List Kernels', () async {
      Kernels _ = await client.droplet.kernels(d.id);
      expect(_, isNotNull);
    });

    test('List Snapshots', () async {
      Snapshots _ = await client.droplet.snapshots(d.id);
      expect(_, isNotNull);
    });
    test('List Backups', () async {
      Backups _ = await client.droplet.backups(d.id);
      expect(_, isNotNull);
    });
    test('List Actions', () async {
      Actions _ = await client.droplet.actions(d.id);
      expect(_, isNotNull);
    });

    test('Delete by tag', () async {
      await client.droplet.deleteByTag("test-dart");
    });

    test('List Neighbors', () async {
      Droplets _ = await client.droplet.lisDropletNeighbors(d.id);
      expect(_, isNotNull);
    });
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
      expect(bs.name, equals(volumeName));
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
      snap = await client.blockStorage.createSnapshot(bsId, bsId);
      expect(snap, isNotNull);
    });
  });

  group('BlockStorageAction', () {
    test('Attach', () async {
      Action action = await client.blockStorageAction.attach(bsId, d.id);
      while (action.status != "completed") {
        print(action.status);
        sleep(Duration(milliseconds: 5000));
        action = await client.action.get(action.id);
      }
      expect(action, isNotNull);
    });
    test('Detach', () async {
      Action action = await client.blockStorageAction.detach(bsId, d.id);
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

  group('DropletActions', () {
    test('rename', () async {
      Action a = await client.dropletAction.rename(d.id, "12345");
      expect(a.type, equals("rename"));
    });
    test('EnableIPv6', () async {
      Action a = await client.dropletAction.enableIPv6(d.id);
      expect(a.type, equals("enable_ipv6"));
    });
    test('EnablePrivateNetworking', () async {
      Action a = await client.dropletAction.enablePrivateNetworking(d.id);
      expect(a.type, equals("enable_private_networking"));
    });

    test('reboot', () async {
      Action a = await client.dropletAction.reboot(d.id);
      expect(a.type, equals("reboot"));
    });
  });
}
