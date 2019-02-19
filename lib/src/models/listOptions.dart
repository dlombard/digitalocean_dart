class ListOptions {
  int page;
  int perPage;
  ListOptions(this.page, {this.perPage});

  @override
  String toString() {
    String s = "$page";
    if (this.perPage != null) s = s + "&$perPage";

    return s;
  }
}
