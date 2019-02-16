import 'package:json_annotation/json_annotation.dart';
import 'droplet.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';
/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'droplets.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Droplets extends IdoCollection{
  List<Droplet> droplets = List();

  Droplets(this.droplets, Links links, Meta meta):super(links, meta);
  
  factory Droplets.fromJson(Map<String, dynamic> json) =>
      _$DropletsFromJson(json);

  Map<String, dynamic> toJson() => _$DropletsToJson(this);

}