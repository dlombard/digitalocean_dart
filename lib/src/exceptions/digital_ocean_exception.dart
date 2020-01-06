import 'dart:convert';

class DigitalOceanException implements Exception {
  String message;
  String id;
  int statusCode;
  dynamic data;
  String uri;

  DigitalOceanException(this.message, this.statusCode,
      {this.id, this.data, this.uri}) {
    var j;
    try {
      j = jsonDecode(message);
    } catch (e) {
      j = null;
    }
    if (j != null) {
      id = j['id'];
    }
  }

  @override
  String toString() {
    Map<String, String> errorString = {
      'message': message,
      'statusCode': statusCode.toString()
    };
    if (id != null) errorString['id'] = id;
    if (data != null) errorString['data'] = data;
    if (uri.isNotEmpty) errorString['uri'] = uri;

    return errorString.toString();
  }
}
