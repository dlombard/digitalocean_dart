import 'package:test/test.dart';
import 'package:do_dart/do_dart.dart';
import 'dart:io' show Platform, File;

void main() {
  Map<String, String> envVars;
  Client client;
  Certificate c;
  var privFile = File('./test/key.pem');
  var pubFile = File('./test/cert.pem');

  setUpAll(() async {
    envVars = Platform.environment;
    client = Client(envVars['DO_KEY']);
    CertificateCreateRequest ccr = CertificateCreateRequest("ucerti", "custom",
        private_key: privFile.readAsStringSync(),
        leaf_certificate: pubFile.readAsStringSync());
    c = await client.certificate.create(ccr);
    expect(c, isNotNull);
  });

  tearDownAll(() async {
    await client.certificate.delete(c.id);
  });

  group('Certificate', () {
    test('Retrieve', () async {
      Certificate _ = await client.certificate.get(c.id);
      expect(_.id, c.id);
    });
    test('List', () async {
      Certificates _ = await client.certificate.list();
      expect(_, isNotNull);
    });
  });
}
