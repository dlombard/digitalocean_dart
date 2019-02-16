import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'ssh_key.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class SSHKey {
  /// This is a unique identification number for the key. This can be used to reference a specific SSH key when you wish to embed a key into a Droplet.
  int id;

  /// This attribute contains the fingerprint value that is generated from the public key. This is a unique identifier that will differentiate it from other keys using a format that SSH recognizes.
  String fingerprint;

  /// This attribute contains the entire public key string that was uploaded. This is what is embedded into the root user's authorized_keys file if you choose to include this SSH key during Droplet creation.
  String public_key;

  /// This is the human-readable display name for the given SSH key. This is used to easily identify the SSH keys when they are displayed.
  String name;

  SSHKey(this.id, this.fingerprint, this.public_key, this.name);

  factory SSHKey.fromJson(Map<String, dynamic> json) => _$SSHKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SSHKeyToJson(this);
}