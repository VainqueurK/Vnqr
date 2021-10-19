import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vainqueur_2/config/responsive.dart';
import 'package:vainqueur_2/pages/homepage_devices/desktop_home.dart';
import 'package:vainqueur_2/routing/routes.dart';

class MyRouter {
  static final FluroRouter router = FluroRouter();

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
            desktop: DesktopHomepage(),
            tablet: Container(),
            mobile: Container(
              color: Colors.green[200],
            ),
          ));

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
