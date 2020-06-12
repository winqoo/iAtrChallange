import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iatros_challange/core/page_navigation_keys.dart';
import 'package:iatros_challange/core/page_router.dart';
import 'package:iatros_challange/core/styles/theme.dart';
import 'package:iatros_challange/generated/l10n.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        AppStyles.updateStyle(constraints);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "iAtros",
          theme: appTheme(),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
          ],
          onGenerateRoute: PageRouter().onGenerateRoute,
          initialRoute: PageNavigationKeys.HOME_ROUTE,
          navigatorKey: PageNavigationKeys.navigatorKey,
          navigatorObservers: [routeObserver],
        );
      },
    );
  }
}
