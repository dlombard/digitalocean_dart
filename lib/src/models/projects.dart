import 'package:json_annotation/json_annotation.dart';
import 'project.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'projects.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Projects extends IdoCollection {
  List<Project> projects = List();

  Projects(this.projects, Links links, Meta meta) : super(links, meta);

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsToJson(this);
}
