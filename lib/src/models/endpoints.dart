import 'package:json_annotation/json_annotation.dart';
import 'endpoint.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';
/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'endpoints.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Endpoints extends IdoCollection{
  List<Endpoint> endpoints = List();

  Endpoints(this.endpoints, Links links, Meta meta):super(links, meta);
  
  factory Endpoints.fromJson(Map<String, dynamic> json) =>
      _$EndpointsFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointsToJson(this);

}