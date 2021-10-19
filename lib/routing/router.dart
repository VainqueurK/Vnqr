import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vainqueur_2/config/responsive.dart';
import 'package:vainqueur_2/models/project.dart';
import 'package:vainqueur_2/models/tags.dart';
import 'package:vainqueur_2/pages/homepage_devices/desktop_home.dart';
import 'package:vainqueur_2/pages/projectpage_devices/desktop_projects.dart';
import 'package:vainqueur_2/routing/routes.dart';

class MyRouter {
  static final FluroRouter router = FluroRouter();
  static Project project = Project(
    "",
    "",
    "",
    "",
    Tags([]),
  ); //gets overwritten

  static final Handler _mainHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Responsive(
            desktop: DesktopHomepage(),
            tablet: Container(),
            mobile: Container(
              color: Colors.green[200],
            ),
          ));

  static final Handler _projectsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Responsive(
            desktop: DesktopProjectsPage(project: project), //project,
            tablet: Container(),
            mobile: Container(
              color: Colors.green[200],
            ),
          ));

  void setProject(Project prjct) {
    project = prjct;
  }

  Project getProject() {
    return project;
  }

  static void setUpRouter() {
    router.define(
      '/',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      MyRoutes.projectsRoute,
      handler: _projectsHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
