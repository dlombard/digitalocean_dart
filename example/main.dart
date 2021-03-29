import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform;

void main() async {
  var envVars = Platform.environment;
  var client = Client(envVars['DO_KEY']!);

  var account = await client.account.get();

  print(account.toString());
}
