import 'package:random_string/random_string.dart';
import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform, File;

void main() {
  Map<String, String> envVars = Platform.environment;
  Client client = Client(envVars['DO_KEY']!);
  Certificate? c;
  var privFile = File('./test/key.pem');
  var pubFile = File('./test/cert.pem');

  setUpAll(() async {
    CertificateCreateRequest ccr = CertificateCreateRequest(
        randomAlpha(8), "custom",
        private_key: privFile.readAsStringSync(),
        leaf_certificate: pubFile.readAsStringSync());
    c = await client.certificate.create(ccr);
    expect(c, isNotNull);
  });

  tearDownAll(() async {
    if (c != null) {
      print(c!.id);
      await client.certificate.delete(c!.id);
    }
  });

  group('Certificate', () {
    test('Retrieve', () async {
      Certificate _ = await client.certificate.get(c!.id);
      expect(_.id, c!.id);
    });
    test('List', () async {
      Certificates _ = await client.certificate.list();
      expect(_, isNotNull);
    });
  });
}
