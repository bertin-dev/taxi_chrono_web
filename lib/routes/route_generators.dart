

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/dashboard_view.dart';
import '../views/signup_view.dart';

class RouteGenerator {

  static PageRoute generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case SignUpView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SignUpView());

      case DashboardView.pageName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext builder) => DashboardView(
              admin: (routeSettings.arguments as Map)["admin"]),
        );

      default:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SignUpView());
    }

  }


}