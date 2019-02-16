class DigitalOceanException implements Exception {
  String message;
  String id;
  int statusCode;

  DigitalOceanException(this.message, this.statusCode, {this.id});

  @override
  String toString() {
    String exceptionString =
        "{id: $id, message: $message, statusCode: $statusCode}";

    return exceptionString;
  }
}
