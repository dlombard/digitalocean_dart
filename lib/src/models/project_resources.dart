import 'package:json_annotation/json_annotation.dart';
import 'project_resource.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';
/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'project_resources.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ProjectResources extends IdoCollection{
  List<ProjectResource> projectResources = List();

  ProjectResources(this.projectResources, Links links, Meta meta):super(links, meta);
  
  factory ProjectResources.fromJson(Map<String, dynamic> json) =>
      _$ProjectResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResourcesToJson(this);

}