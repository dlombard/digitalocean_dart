import 'package:json_annotation/json_annotation.dart';
import 'action.dart';
import 'IdoCollection.dart';
import 'meta.dart';
import 'links.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'actions.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Actions extends IdoCollection {
  List<Action> actions;

  Actions(this.actions, Links links, Meta meta) : super(links, meta);

  factory Actions.fromJson(Map<String, dynamic> json) =>
      _$ActionsFromJson(json);
  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
