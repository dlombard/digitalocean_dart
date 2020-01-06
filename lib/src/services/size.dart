import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/size.dart';
import '../models/sizes.dart';

class SizeService extends DOService {
  SizeService(Client client) : super(client, '/v2/sizes');

  Future<Sizes> list([ListOptions op]) async {
    var path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    var _ = <Size>[];
    for (dynamic item in data['sizes']) {
      _.add(Size.fromJson(item));
    }

    var collectionData = client.getDOCollectionData(data);
    return Sizes(_, collectionData['links'], collectionData['meta']);
  }
}
