import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vainqueur_2/config/responsive.dart';
import 'package:vainqueur_2/models/project.dart';
import 'package:vainqueur_2/models/tags.dart';
import 'package:vainqueur_2/pages/homepage_devices/desktop_home.dart';
import 'package:vainqueur_2/pages/homepage_devices/mobile_home.dart';

import 'package:vainqueur_2/pages/projectpage_devices/desktop_projects.dart';
import 'package:vainqueur_2/pages/projectpage_devices/mobile_projects.dart';
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
          const Responsive(
            desktop: DesktopHomepage(),
            tablet: MobileHomepage(),
            mobile: MobileHomepage(),
          ));

  static final Handler _projectsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Responsive(
            desktop: DesktopProjectsPage(project: project),
            tablet: MobileProjectsPage(project: project),
            mobile: MobileProjectsPage(project: project),
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
