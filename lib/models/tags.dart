class Tags {
  List<String> tags = [];

  Tags(List<String> input) {
    tags = input;
  }

  addTag(String tag) {
    tags.add(tag);
  }

  getTag(int i) {
    return tags.elementAt(i);
  }

  getTags() {
    return tags;
  }

  getTagSize() {
    return tags.length;
  }
}
