import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/image.dart';
import '../models/images.dart';
import '../models/action.dart';
import '../models/actions.dart';

class ImageService extends DOService {
  ImageService(Client client) : super(client, '/v2/images');

  /// List all Images
  Future<Images> list([ListOptions op]) async {
    var path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Images(_toList(data['images']), collectionData['links'],
        collectionData['meta']);
  }

  /// List all Distribution Images
  Future<Images> listDistributionImages([ListOptions op]) async {
    var path = '$basePath?type=distribution';
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Images(_toList(data['images']), collectionData['links'],
        collectionData['meta']);
  }

  /// List all Application Images
  Future<Images> listApplicationImages([ListOptions op]) async {
    var path = '$basePath?type=application';
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Images(_toList(data['images']), collectionData['links'],
        collectionData['meta']);
  }

  /// List all User's Images
  Future<Images> listUsersImages([ListOptions op]) async {
    var path = '$basePath?private=true';
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Images(_toList(data['images']), collectionData['links'],
        collectionData['meta']);
  }

  /// List all User's Images
  Future<Images> listByTag(String tagName, [ListOptions op]) async {
    var path = '$basePath?tag_name=$tagName';
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Images(_toList(data['images']), collectionData['links'],
        collectionData['meta']);
  }

  /// Create a Custom Image
  Future<Image> create(String name, String url, String region,
      [String distribution, String description, List<String> tags]) async {
    Map<String, dynamic> json = {
      'name': name,
      'url': url,
      'region': region,
    };

    if (distribution != null) json['distribution'] = distribution;
    if (description != null) json['description'] = description;
    if (tags != null) json['tags'] = tags;

    dynamic data = await client.execute('POST', basePath);

    return Image.fromJson(data['image']);
  }

  /// Retrieve an existing Image by id
  Future<Image> get(String imageId) async {
    var path = '$basePath/$imageId';
    dynamic data = await client.execute('GET', path);

    return Image.fromJson(data['image']);
  }

  /// Retrieve an existing Image by slug
  Future<Image> getBySlug(String slug) async {
    var path = '$basePath/$slug';
    dynamic data = await client.execute('GET', path);

    return Image.fromJson(data['image']);
  }

  /// Updates an image
  Future<Image> update(String imageId, String name,
      [String distribution, String description]) async {
    var path = '$basePath/$imageId';

    Map<String, dynamic> json = {
      'name': name,
    };
    if (distribution != null) json['distribution'] = distribution;
    if (description != null) json['description'] = description;

    dynamic data = await client.execute('PUT', path);

    return Image.fromJson(data['image']);
  }

  /// List image actions
  Future<Actions> actions(String imageId) async {
    var path = '$basePath/$imageId/actions';

    dynamic data = await client.execute('GET', path);
    Map<String, dynamic> collectionData = client.getDOCollectionData(data);

    List<Action> _ = List();
    for (dynamic item in data['actions']) {
      _.add(Action.fromJson(item));
    }
    return Actions(_, collectionData['links'], collectionData['meta']);
  }

  /// Delete an existing Image by id
  Future<void> delete(String imageId) async {
    var path = '$basePath/$imageId';
    dynamic data = await client.execute('DELETE', path);

    return Image.fromJson(data['image']);
  }
  List<Image> _toList(List<dynamic> data) {
    List<Image> _ = List();
    for (dynamic item in data) {
      _.add(Image.fromJson(item));
    }
    return _;
  }
}
