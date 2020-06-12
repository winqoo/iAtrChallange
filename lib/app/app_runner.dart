import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iatros_challange/modules/home/domain/home_bloc.dart';

import 'app.dart';

void runApplication() async {
  _setupErrorHandling();
  await _setPortraitMode();
  _runApp();
}

void _setupErrorHandling() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
}

Future<void> _setPortraitMode() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _runApp() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: App(),
    ),
  );
}
