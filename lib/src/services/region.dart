import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/region.dart';
import '../models/regions.dart';

class RegionService extends DOService {
  RegionService(Client client) : super(client, '/v2/regions');

  Future<Regions> list([ListOptions op]) async {
    var path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    var _ = List<Region>();
    for (dynamic item in data['regions']) {
      _.add(Region.fromJson(item));
    }

    var collectionData = client.getDOCollectionData(data);
    return Regions(_, collectionData['links'], collectionData['meta']);
  }
}
