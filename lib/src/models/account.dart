import 'package:json_annotation/json_annotation.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'account.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Account {
  /// The total number of Droplets current user or team may have active at one time.
  int droplet_limit;

  /// The total number of Floating IPs the current user or team may have.
  int floating_ip_limit;

  /// The email address used by the current user to registered for DigitalOcean.
  String email;

  /// The unique universal identifier for the current user.
  String uuid;

  /// If true, the user has verified their account via email. False otherwise.
  bool email_verified;

  /// This value is one of "active", "warning" or "locked".
  String status;

  /// A human-readable message giving more details about the status of the account.
  String status_message;

  Account(this.droplet_limit, this.floating_ip_limit, this.email, this.uuid,
      this.email_verified, this.status, this.status_message);

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
