import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars;
  Client client;
  int actionId;
  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    Actions _as = await client.action.list();

    actionId = _as.actions.first.id;
  });

  group('Action', () {
    test('listActions', () async {
      var lo = new ListOptions(2, perPage: 25);
      print(lo.toString());
      var _ = await client.action.list(listOptions: lo);
      print(_.links.pages.toJson());
      expect(_, isNotNull);
    });

    test('getActions', () async {
      Action a = await client.action.get(actionId);
      expect(a.id, equals(actionId));
    });
  });
}
