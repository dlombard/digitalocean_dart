import 'package:dio/dio.dart';
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
  final String libraryVersion = "0.1.0";
  final String defaultBaseURL = "https://api.digitalocean.com/";
  final String mediaType = "application/json";
  final String headerRateLimit = "RateLimit-Limit";
  final String headerRateRemaining = "RateLimit-Remaining";
  final String headerRateReset = "RateLimit-Reset";
  final String _api_token;
  AccountService account;
  ActionService action;
  BlockStorageService blockStorage;
  BlockStorageActionService blockStorageAction;
  CertificateService certificate;
  DomainService domain;
  DomainRecordService domainRecord;
  DropletService droplet;
  DropletActionService dropletAction;
  EndpointService endpoint;
  FirewallService firewall;
  FloatingIPService floatingIp;
  FloatingIPActionService floatingIpAction;
  ImageService image;
  ImageActionService imageAction;
  ProjectResourceService projectResource;
  ProjectService project;
  RegionService region;
  SizeService size;
  SnapshotService snapshot;
  SSHKeyService ssh;
  Dio _client;
  String userAgent;

  Client(this._api_token) {
    this.userAgent = "dodart/" + libraryVersion;
    buildDio();
    account = new AccountService(this);
    action = new ActionService(this);
    blockStorage = new BlockStorageService(this);
    blockStorageAction = new BlockStorageActionService(this);
    certificate = new CertificateService(this);
    domain = new DomainService(this);
    domainRecord = new DomainRecordService(this);
    droplet = new DropletService(this);
    dropletAction = new DropletActionService(this);
    endpoint = new EndpointService(this);
    firewall = new FirewallService(this);
    floatingIp = new FloatingIPService(this);
    floatingIpAction = new FloatingIPActionService(this);
    image = new ImageService(this);
    imageAction = new ImageActionService(this);
    project = new ProjectService(this);
    projectResource = new ProjectResourceService(this);
    region = new RegionService(this);
    size = new SizeService(this);
    snapshot = new SnapshotService(this);
    ssh = new SSHKeyService(this);
  }

  void buildDio() {
    Map<String, dynamic> headers = Map();
    headers["Accept"] = mediaType;
    headers["User-Agent"] = userAgent;
    headers["Authorization"] = "Bearer " + this._api_token;
    BaseOptions o = new BaseOptions(baseUrl: defaultBaseURL, headers: headers);

    _client = new Dio(o);
  }

  Future<dynamic> execute(String method, String path,
      {Map<String, dynamic> json}) async {
    try {
      Response r;
      _client.options.method = method;
      if (json != null)
        r = await _client.request(path,
            options: Options(method: method), data: jsonEncode(json));
      else
        r = await _client.request(path, options: Options(method: method));

      return r.data;
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        print(dioError.response.request.data);
        if (dioError.response.statusCode >= 500) {
          throw DigitalOceanException(
              dioError.response.data, dioError.response.statusCode);
        } else
          throw DigitalOceanException(
              dioError.response.data['message'], dioError.response.statusCode,
              id: dioError.response.data['id']);
      } else {
        rethrow;
      }
    }
  }

  Map<String, dynamic> getDOCollectionData(dynamic responseData) {
    Map<String, dynamic> res = {
      "links": _getLinks(responseData),
      "meta": _getMeta(responseData)
    };
    return res;
  }

  Links _getLinks(dynamic responseData) {
    if (responseData['links']['pages'] != null) {
      return Links(Pages.fromJson(responseData['links']['pages']));
    }
    return Links(null);
  }

  Meta _getMeta(dynamic responseData) {
    return Meta.fromJson(responseData['meta']);
  }
}
