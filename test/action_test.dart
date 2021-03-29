import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);

  int? actionId;

  setUp(() async {
    Actions _as = await client.action.list();

    actionId = _as.actions.first.id;
  });

  group('Action', () {
    test('listActions', () async {
      var lo = new ListOptions(2, perPage: 25);
      var _ = await client.action.list(listOptions: lo);
      expect(_, isNotNull);
    });

    test('getActions', () async {
      if (actionId != null) {
        Action a = await client.action.get(actionId!);
        expect(a.id, equals(actionId));
      }
    });
  });
}
