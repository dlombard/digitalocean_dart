import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  Droplet d;
  Droplets ds;

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    DropletCreateRequest dcr = DropletCreateRequest(
        "test-droplet", 'nyc1', 's-1vcpu-1gb', 43515152,
        ssh_keys: [1551138]);
    d = await client.droplet.create(dcr);
    expect(d, isNotNull);

    DropletCreateManyRequest dcmr = DropletCreateManyRequest(
        ["many-1", "many-2", "many-3"], 'nyc1', 's-1vcpu-1gb', 43515152,
        tags: ["test-dart"], ssh_keys: [1551138]);
    ds = await client.droplet.createMany(dcmr);

    expect(ds, isNotNull);
  });

  tearDownAll(() async {
    await client.droplet.delete(d.id);
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
      expect(droplets.getCount(), isPositive);
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
}
