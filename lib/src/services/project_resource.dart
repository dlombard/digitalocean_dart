import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/project_resource.dart';
import '../models/project_resources.dart';
import '../models/urn.dart';

class ProjectResourceService extends DOService {
  final String _fieldName = 'resources';
  ProjectResourceService(Client client) : super(client, '/v2/projects');

  /// Lists Project Resources
  Future<ProjectResources> listResources(String projectId) async {
    var path = '$basePath/$projectId/resources';
    dynamic data = await client.execute('GET', path);

    var _ = _toList(data[_fieldName]);
    var collectionData = client.getDOCollectionData(data);

    return ProjectResources(_, collectionData['links'], collectionData['meta']);
  }

  /// Assigns Project Resources
  Future<ProjectResource> assignResource(
      String projectId, List<Urn> urns) async {
    var path = '$basePath/$projectId/resources';
    var resources = <String>[];
    for (var _ in urns) {
      resources.add(_.toString());
    }
    dynamic data =
        await client.execute('POST', path, json: {'resources': resources});

    return ProjectResource.fromJson(data['ssh_key']);
  }

  /// Lists Default Project Resources
  Future<ProjectResources> listDefaultProjectResources() async {
    var path = '$basePath/default/resources';
    dynamic data = await client.execute('GET', path);
    var _ = _toList(data[_fieldName]);
    var collectionData = client.getDOCollectionData(data);

    return ProjectResources(_, collectionData['links'], collectionData['meta']);
  }

  /// Assigns Default Project Resources
  Future<ProjectResources> assignDefaultProjectResources(
      [ListOptions op]) async {
    var path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    var _ = _toList(data['ProjectResources']);

    var collectionData = client.getDOCollectionData(data);
    return ProjectResources(_, collectionData['links'], collectionData['meta']);
  }

  List<ProjectResource> _toList(List<dynamic> data) {
    var _ = <ProjectResource>[];
    for (dynamic item in data) {
      _.add(ProjectResource.fromJson(item));
    }
    return _;
  }
}
