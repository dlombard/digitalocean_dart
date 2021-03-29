import 'package:random_string/random_string.dart';
import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);
  Droplet? d;
  Droplets? ds;
  int imageId = 47219194;
  String tag = randomAlpha(8);

  setUp(() async {
    DropletCreateRequest dcr = DropletCreateRequest(
        randomAlpha(6), 'nyc1', 's-1vcpu-1gb', imageId,
        ssh_keys: [1551138]);
    d = await client.droplet.create(dcr);
    expect(d, isNotNull);

    DropletCreateManyRequest dcmr = DropletCreateManyRequest(
        [randomAlpha(6), randomAlpha(6), randomAlpha(6)],
        'nyc1',
        's-1vcpu-1gb',
        imageId,
        tags: [tag],
        ssh_keys: [1551138]);
    ds = await client.droplet.createMany(dcmr);

    expect(ds, isNotNull);
  });

  tearDown(() async {
    await client.droplet.delete(d!.id);
    await client.droplet.deleteByTag(tag);
  });

  group('Droplets', () {
    test('GetDroplet', () async {
      Droplet droplet = await client.droplet.get(d!.id);
      expect(droplet, isNotNull);
      expect(droplet.id, equals(d!.id));
    });
    test('List all', () async {
      Droplets droplets = await client.droplet.list();
      expect(droplets.getCount(), isPositive);
    });
    test('List by tag', () async {
      Droplets droplets = await client.droplet.listByTag(tag);
      expect(droplets.getCount(), isPositive);
    });
    test('List Kernels', () async {
      Kernels _ = await client.droplet.kernels(d!.id);
      expect(_, isNotNull);
    });

    test('List Snapshots', () async {
      Snapshots _ = await client.droplet.snapshots(d!.id);
      expect(_, isNotNull);
    });
    test('List Backups', () async {
      Backups _ = await client.droplet.backups(d!.id);
      expect(_, isNotNull);
    });
    test('List Actions', () async {
      Actions _ = await client.droplet.actions(d!.id);
      expect(_, isNotNull);
    });

    test('Delete by tag', () async {
      await client.droplet.deleteByTag("test-dart");
    });

    test('List Neighbors', () async {
      Droplets _ = await client.droplet.lisDropletNeighbors(d!.id);
      expect(_, isNotNull);
    });
  });

  group('DropletActions', () {
    test('rename', () async {
      Action a = await client.dropletAction.rename(d!.id, "12345");
      expect(a.type, equals("rename"));
    });
    test('EnableIPv6', () async {
      Action a = await client.dropletAction.enableIPv6(d!.id);
      expect(a.type, equals("enable_ipv6"));
    });

    test('reboot', () async {
      Action a = await client.dropletAction.reboot(d!.id);
      expect(a.type, equals("reboot"));
    });
  });
}
