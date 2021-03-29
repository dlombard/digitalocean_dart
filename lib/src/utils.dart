import './models/listOptions.dart';

class Utils {
  static String getPathFromListOptions(basePath, [ListOptions? o]) {
    var path = basePath;
    if (o != null) {
      if (!path.contains('?')) {
        path = path + '?' + o.toString();
      } else {
        path + '&' + o.toString();
      }
    }

    return path;
  }
}
