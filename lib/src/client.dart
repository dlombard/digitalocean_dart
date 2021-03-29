import 'dart:async';
import 'dart:io';
import 'package:do_dart/do_dart.dart';
import 'dart:convert';
import 'services/account.dart';
import 'services/action.dart';
import 'services/block_storage.dart';
import 'services/block_storage_action.dart';
import 'services/certificate.dart';
import 'services/domain.dart';
import 'services/domain_record.dart';
import 'services/droplet.dart';
import 'services/droplet_action.dart';
import 'services/endpoint.dart';
import 'services/firewall.dart';
import 'services/floating_ip.dart';
import 'services/floating_ip_action.dart';
import 'services/image.dart';
import 'services/image_action.dart';
import 'services/project.dart';
import 'services/project_resource.dart';
import 'services/region.dart';
import 'services/size.dart';
import 'services/snapshot.dart';
import 'services/ssh_key.dart';
import './models/links.dart';
import './models/meta.dart';
import './models/pages.dart';
import 'exceptions/digital_ocean_exception.dart';

class Client {
  final String libraryVersion = '2.0.0-dev.0';
  final String defaultBaseURL = 'https://api.digitalocean.com/';
  final String mediaType = 'application/json';
  final String headerRateLimit = 'RateLimit-Limit';
  final String headerRateRemaining = 'RateLimit-Remaining';
  final String headerRateReset = 'RateLimit-Reset';
  final String _api_token;
  late AccountService account;
  late ActionService action;
  late BlockStorageService blockStorage;
  late BlockStorageActionService blockStorageAction;
  late CertificateService certificate;
  late DomainService domain;
  late DomainRecordService domainRecord;
  late DropletService droplet;
  late DropletActionService dropletAction;
  late EndpointService endpoint;
  late FirewallService firewall;
  late FloatingIPService floatingIp;
  late FloatingIPActionService floatingIpAction;
  late ImageService image;
  late ImageActionService imageAction;
  late ProjectResourceService projectResource;
  late ProjectService project;
  late RegionService region;
  late SizeService size;
  late SnapshotService snapshot;
  late SSHKeyService ssh;
  late HttpClient _client;
  late String userAgent;

  Client(this._api_token) {
    userAgent = 'dodart/' + libraryVersion;
    buildClient();
    account = AccountService(this);
    action = ActionService(this);
    blockStorage = BlockStorageService(this);
    blockStorageAction = BlockStorageActionService(this);
    certificate = CertificateService(this);
    domain = DomainService(this);
    domainRecord = DomainRecordService(this);
    droplet = DropletService(this);
    dropletAction = DropletActionService(this);
    endpoint = EndpointService(this);
    firewall = FirewallService(this);
    floatingIp = FloatingIPService(this);
    floatingIpAction = FloatingIPActionService(this);
    image = ImageService(this);
    imageAction = ImageActionService(this);
    project = ProjectService(this);
    projectResource = ProjectResourceService(this);
    region = RegionService(this);
    size = SizeService(this);
    snapshot = SnapshotService(this);
    ssh = SSHKeyService(this);
  }

  void buildClient() {
    _client = HttpClient();
  }

  Future<dynamic> execute(String method, String path, {dynamic json}) async {
    try {
      var params = path.split('?');
      var uri;
      if (params.length == 1) {
        uri = Uri(scheme: 'https', host: 'api.digitalocean.com', path: path);
      } else {
        uri = Uri(
            scheme: 'https',
            host: 'api.digitalocean.com',
            path: params.elementAt(0),
            query: params.elementAt(1));
      }

      switch (method.toUpperCase()) {
        case 'DELETE':
          return executeRequest(
            await _client.deleteUrl(uri),
          );
        case 'GET':
          if (json != null) {
            return executeRequest(await _client.getUrl(uri), body: json);
          } else {
            return executeRequest(await _client.getUrl(uri));
          }
        case 'PATCH':
          if (json != null) {
            return executeRequest(await _client.patchUrl(uri), body: json);
          } else {
            return executeRequest(await _client.patchUrl(uri));
          }
        case 'POST':
          if (json != null) {
            return executeRequest(await _client.postUrl(uri), body: json);
          } else {
            return executeRequest(await _client.postUrl(uri));
          }
        case 'PUT':
          if (json != null) {
            return executeRequest(await _client.putUrl(uri), body: json);
          } else {
            return executeRequest(await _client.putUrl(uri));
          }
        default:
          break;
      }

      //return response;
    } on HttpException catch (e) {
      print(e.message);
    } on DigitalOceanException catch (dE) {
      print(dE.toString());
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<dynamic> executeRequest(HttpClientRequest request,
      {dynamic body}) async {
    request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    request.headers.add('Authorization', 'Bearer ' + _api_token);
    request.headers.add('User-Agent', userAgent);

    if (body != null) request.write(jsonEncode(body));

    var response = await request.close();
    var completer = Completer<String>();

    var sink = StringConversionSink.withCallback((s) => completer.complete(s));

    response.transform(utf8.decoder).listen(sink.add,
        onError: completer.completeError,
        onDone: sink.close,
        cancelOnError: true);

    var resp = await completer.future;

    if (response.statusCode >= 400) {
      throw DigitalOceanException(resp, response.statusCode,
          uri: request.uri.toString());
    }
    if (resp.isNotEmpty) {
      var r = jsonDecode(resp);

      return r;
    } else {
      return resp;
    }
  }

  Map<String, dynamic> getDOCollectionData(dynamic responseData) {
    var res = {
      'links': _getLinks(responseData),
      'meta': _getMeta(responseData)
    };
    return res;
  }

  Links _getLinks(dynamic responseData) {
    if (responseData['links'] != null) {
      if (responseData['links']['pages'] != null) {
        return Links(Pages.fromJson(responseData['links']['pages']));
      }
    }

    return Links(null);
  }

  Meta _getMeta(dynamic responseData) {
    if (responseData['meta'] != null) {
      return Meta.fromJson(responseData['meta']);
    }
    return Meta(0);
  }
}
