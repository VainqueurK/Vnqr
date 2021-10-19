import 'package:vainqueur_2/models/tags.dart';

class Project {
  String img = "";
  String title = "";
  String desc = "";
  String github = "";
  Tags tags = Tags([]);

  Project(this.img, this.title, this.desc, this.github, this.tags);
}
