import 'package:json_annotation/json_annotation.dart';
import 'region.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';
/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'regions.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Regions extends IdoCollection{
  List<Region> regions = List();

  Regions(this.regions, Links links, Meta meta):super(links, meta);
  
  factory Regions.fromJson(Map<String, dynamic> json) =>
      _$RegionsFromJson(json);

  Map<String, dynamic> toJson() => _$RegionsToJson(this);

}