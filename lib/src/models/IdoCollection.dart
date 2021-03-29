import 'links.dart';
import 'meta.dart';

class IdoCollection {
  Links? links;
  Meta? meta;

  IdoCollection(this.links, this.meta);

  int getCount() {
    return meta!.total;
  }
}
