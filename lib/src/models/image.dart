import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'image.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Image {

  /// A unique number that can be used to identify and reference a specific image.
  int id;

  /// The display name that has been given to an image. This is what is shown in the control panel and is generally a descriptive title for the image in question.
  String name;

  /// The kind of image, describing the duration of how long the image is stored. This is either "snapshot", "backup", or "custom".
  String type;

  /// This attribute describes the base distribution used for this image. For custom images, this is user defined.
  String distribution;

  /// A uniquely identifying string that is associated with each of the DigitalOcean-provided public images. These can be used to reference a public image as an alternative to the numeric id.
  String slug;
  
  /// This is a boolean value that indicates whether the image in question is public or not. An image that is public is available to all accounts. A non-public image is only accessible from your account.
  bool public;

  /// This attribute is an array of the regions that the image is available in. The regions are represented by their identifying slug values.
  List<String> regions = [];

  /// A time value given in ISO8601 combined date and time format that represents when the image was created.
  String created_at;

  /// The minimum disk size in GB required for a Droplet to use this image.
  int min_disk_size;

  /// The size of the image in gigabytes
  double size_gigabytes;

  /// An optional free-form text field to describe an image.
  String description;

  /// An array containing the names of the tags the image has been tagged with.
  List<String> tags;

  /// A status string indicating the state of a custom image. This may be "NEW", "available", "pending", or "deleted".
  String status;

  /// A string containing information about errors that may occur when importing a custom image.
  String error_message;

  Image(
      this.id,
      this.name,
      this.type,
      this.distribution,
      this.public,
      this.regions,
      this.created_at,
      this.min_disk_size,
      this.size_gigabytes,
      this.description,
      this.tags,
      this.status,
      {this.slug});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
