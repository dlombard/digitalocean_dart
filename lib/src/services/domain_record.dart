import 'package:json_annotation/json_annotation.dart';
import '../client.dart';
import '../models/domain_record.dart';
import '../models/domain_records.dart';
import '../utils.dart';
import 'doService.dart';
import '../models/listOptions.dart';

part 'domain_record.g.dart';

class DomainRecordService extends DOService {
  final String _FIELD_NAME = 'domain_record';
  DomainRecordService(Client client) : super(client, '/v2/domains');

  /// List all Domain Records
  Future<DomainRecords> list(String name, {ListOptions ops}) async {
    var path = basePath + '/' + name + '/records';

    if (ops != null) path = Utils.getPathFromListOptions(ops, path);

    dynamic r = await client.execute('GET', path);

    var _ = _toList(r['domain_records']);
    var collectionData = client.getDOCollectionData(r);

    return DomainRecords(_, collectionData['links'], collectionData['meta']);
  }

  /// Create a new Domain Record
  ///
  Future<DomainRecord> create(
      String name, DomainRecordCreateRequest drcr) async {
    var path = basePath + '/' + name + '/records';

    dynamic data = await client.execute('POST', path, json: drcr.toJson());

    return DomainRecord.fromJson(data[_FIELD_NAME]);
  }

  /// Retrieve an existing domain record
  Future<DomainRecord> get(String name, String recordId) async {
    var path = basePath + '/' + name + '/records' + recordId;

    dynamic data = await client.execute('GET', path);

    return DomainRecord.fromJson(data[_FIELD_NAME]);
  }

  /// Update a Domain Record
  Future<DomainRecord> update(
      String name, String recordId, DomainRecordUpdateRequest drur) async {
    var path = basePath + '/' + name + '/records' + recordId;

    dynamic data = await client.execute('PUT', path, json: drur.toJson());

    return DomainRecord.fromJson(data[_FIELD_NAME]);
  }

  /// Delete a domain Record
  Future<void> delete(String name, String recordId) async {
    var path = basePath + '/' + name + '/records' + recordId;

    await client.execute('DELETE', path);
  }

  List<DomainRecord> _toList(List<dynamic> data) {
    var drs = List<DomainRecord>();
    for (dynamic item in data) {
      drs.add(DomainRecord.fromJson(item));
    }
    return drs;
  }
}

@JsonSerializable()
class DomainRecordCreateRequest {
  String type;
  String name;
  String data;
  int priority;
  int port;
  int ttl;
  int weight;
  int flags;
  String tag;

  DomainRecordCreateRequest(this.type, this.name, this.data, this.priority,
      this.port, this.ttl, this.weight, this.flags, this.tag);

  factory DomainRecordCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$DomainRecordCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DomainRecordCreateRequestToJson(this);
}

@JsonSerializable()
class DomainRecordUpdateRequest {
  String type;
  String name;
  String data;
  int priority;
  int port;
  int ttl;
  int weight;
  int flags;
  String tag;

  DomainRecordUpdateRequest(
      {this.type,
      this.name,
      this.data,
      this.priority,
      this.port,
      this.ttl,
      this.weight,
      this.flags,
      this.tag});

  factory DomainRecordUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$DomainRecordUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DomainRecordUpdateRequestToJson(this);
}
