import 'package:flutter/material.dart';
import 'package:iatros_challange/core/page_navigation_keys.dart';
import 'package:iatros_challange/modules/home/home_page.dart';
import 'package:iatros_challange/modules/task/task_detail_page.dart';

class PageRouter {
  Function(RouteSettings) onGenerateRoute = (RouteSettings settings) {
    switch (settings.name) {
      case PageNavigationKeys.HOME_ROUTE:
        return MaterialPageRoute(builder: (context) => HomePage());
      case PageNavigationKeys.TASK_DETAILS_ROUTE:
        return MaterialPageRoute(
          builder: (context) => TaskDetailPage(
            task: settings.arguments,
          ),
        );
      default:
        return null;
    }
  };
}
