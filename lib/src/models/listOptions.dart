class ListOptions {
  int page;
  int? perPage;
  ListOptions(this.page, {this.perPage});

  @override
  String toString() {
    var s = 'page=$page';
    if (perPage != null) s = s + '&per_page=$perPage';

    return s;
  }
}
