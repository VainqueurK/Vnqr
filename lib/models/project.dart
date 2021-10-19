import 'package:vainqueur_2/models/tags.dart';

class Project {
  String img = "";
  String title = "";
  String desc = "";
  List<Tags> tags = [];

  Project(this.img, this.title, this.desc, this.tags);
}
