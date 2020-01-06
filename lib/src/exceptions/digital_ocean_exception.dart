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
    } catch (e) {}
    if (j != null) {
      this.id = j['id'];
    }
  }

  @override
  String toString() {
    Map<String, String> errorString = {
      "message": this.message,
      "statusCode": this.statusCode.toString()
    };
    if (this.id.isNotEmpty) errorString['id'] = this.id;
    if (this.data != null) errorString['data'] = this.data;
    if (this.uri.isNotEmpty) errorString['uri'] = this.uri;

    return errorString.toString();
  }
}
