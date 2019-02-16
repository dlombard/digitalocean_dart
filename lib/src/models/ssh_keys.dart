import 'package:json_annotation/json_annotation.dart';
import 'ssh_key.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';
/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'ssh_keys.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class SSHKeys extends IdoCollection{
  List<SSHKey> sshKeys = List();

  SSHKeys(this.sshKeys, Links links, Meta meta):super(links, meta);
  
  factory SSHKeys.fromJson(Map<String, dynamic> json) =>
      _$SSHKeysFromJson(json);

  Map<String, dynamic> toJson() => _$SSHKeysToJson(this);

}