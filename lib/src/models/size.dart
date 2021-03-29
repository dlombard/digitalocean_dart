import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'size.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Size {
  /// A human-readable string that is used to uniquely identify each size.
  String slug;

  /// This is a boolean value that represents whether new Droplets can be created with this size.
  bool available;

  /// The amount of transfer bandwidth that is available for Droplets created in this size. This only counts traffic on the public interface. The value is given in terabytes.
  double transfer;

  /// This attribute describes the monthly cost of this Droplet size if the Droplet is kept for an entire month. The value is measured in US dollars.
  double price_monthly;

  /// This describes the price of the Droplet size as measured hourly. The value is measured in US dollars.
  double price_hourly;

  /// The amount of RAM allocated to Droplets created of this size. The value is represented in megabytes.
  int memory;

  /// The integer of number CPUs allocated to Droplets of this size.
  int vcpus;

  /// The amount of disk space set aside for Droplets of this size. The value is represented in gigabytes.
  int disk;

  /// An array containing the region slugs where this size is available for Droplet creates.
  @JsonKey(defaultValue: [])
  List<String> regions = [];

  Size(this.slug, this.available, this.transfer, this.price_monthly,
      this.price_hourly, this.memory, this.vcpus, this.disk, this.regions);

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);
  Map<String, dynamic> toJson() => _$SizeToJson(this);
}
