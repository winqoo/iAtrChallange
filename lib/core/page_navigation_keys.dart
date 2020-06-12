import 'package:flutter/material.dart';

/*
 * This class contains all of the constants and keys that need to be accessible across modules.
 * This does not contain route generation logic as this should be isolated to the implementing feature package.
 */
class PageNavigationKeys {
  static const HOME_ROUTE = '/home';
  static const TASK_DETAILS_ROUTE = '/task_details';
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
