import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

class AppState {
  bool busy;
  bool errorFatal;
  Exception error;

  AppState({
    this.busy = false,
    this.errorFatal = false,
    this.error,
  });

  AppState.from(AppState state) :
    busy = state.busy,
    errorFatal = state.errorFatal,
    error = state.error;
}

abstract class AppBloc<T, TT extends AppState> extends Bloc<T, TT> {
  final TT _initialState;

  AppBloc({ @required TT initialState }) :
    _initialState = initialState;

  @override
  TT get initialState => _initialState;
}