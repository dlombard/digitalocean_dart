class ListOptions {
  int page;
  int perPage;
  ListOptions(this.page, {this.perPage});

  @override
  String toString() {
    var s = '$page';
    if (perPage != null) s = s + '&$perPage';

    return s;
  }
}
