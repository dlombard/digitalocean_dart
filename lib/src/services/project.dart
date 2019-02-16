import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/project.dart';
import '../models/projects.dart';

class ProjectService extends DOService {
  ProjectService(Client client) : super(client, "/v2/projects");

  /// Create a project
  /// [purpose]: The purpose of the project. The maximum length is 255 characters. For examples of valid purposes, see the "Purpose" class or pass a random string
  Future<Project> create(String name, String purpose,
      [String description, Environment environment]) async {
    Map<String, dynamic> json = {"name": name, "purpose": purpose};
    if (description != null) json['description'] = description;
    if (environment != null) json['environment'] = environment;

    dynamic data = await client.execute('POST', basePath, json: json);

    return Project.fromJson(data['project']);
  }

  /// Lists all Projects
  Future<Projects> list([ListOptions ops]) async {
    String path = Utils.getPathFromListOptions(ops, basePath);

    dynamic data = await client.execute('GET', path);
    Map<String, dynamic> collectionData = client.getDOCollectionData(data);

    return Projects(_toList(data['projects']), collectionData['links'],
        collectionData['meta']);
  }

  /// Updates a project
  Future<Project> update(String projectId, String name, String description,
      String purpose, bool is_default,
      [Environment e]) async {
    String path = "$basePath/$projectId";
    Map<String, dynamic> json = {
      "name": name,
      "description": description,
      "purpose": purpose,
      "is_default": is_default,
      "environment": e
    };

    dynamic data = await client.execute('PUT', path, json: json);

    return Project.fromJson(data['project']);
  }

  /// Patches a project
  Future<Project> patch(String projectId, String name, String description,
      String purpose, bool is_default,
      [Environment e]) async {
    String path = "$basePath/$projectId";
    Map<String, dynamic> json = {
      "name": name,
      "description": description,
      "purpose": purpose,
      "is_default": is_default,
      "environment": e
    };

    dynamic data = await client.execute('PATCH', path, json: json);

    return Project.fromJson(data['project']);
  }

  /// Get a project
  Future<Project> get(String projectId) async {
    String path = "$basePath/$projectId";

    dynamic data = await client.execute('GET', path);

    return Project.fromJson(data['project']);
  }

  /// Get default project
  Future<Project> getDefault() async {
    String path = "$basePath/default";

    dynamic data = await client.execute('GET', path);

    return Project.fromJson(data['project']);
  }

  /// Updates the default project
  Future<Project> updateDefault(
      String name, String description, String purpose, bool is_default,
      [Environment e]) async {
    String path = "$basePath/default";
    Map<String, dynamic> json = {
      "name": name,
      "description": description,
      "purpose": purpose,
      "is_default": is_default,
      "environment": e
    };

    dynamic data = await client.execute('PUT', path, json: json);

    return Project.fromJson(data['project']);
  }

  /// Patches the default project
  Future<Project> patchDefault(
      String name, String description, String purpose, bool is_default,
      [Environment e]) async {
    String path = "$basePath/default";
    Map<String, dynamic> json = {
      "name": name,
      "description": description,
      "purpose": purpose,
      "is_default": is_default,
      "environment": e
    };

    dynamic data = await client.execute('PATCH', path, json: json);

    return Project.fromJson(data['project']);
  }

  List<Project> _toList(List<dynamic> data) {
    List<Project> _ = List();
    for (dynamic item in data) {
      _.add(Project.fromJson(item));
    }
    return _;
  }
}

enum Environment { Development, Staging, Production }

class Purpose {
  static final String trying = "Just trying out DigitalOcean";
  static final String educational = "Class project / Educational purposes";
  static final String web = "Website or blog";
  static final String webApp = "Web Application";
  static final String service = "Service or API";
  static final String mobileApp = "Mobile Application";
  static final String ai = "Machine learning / AI / Data processing";
  static final String iot = "IoT";
  static final String ops = "Operational / Developer tooling";
}
