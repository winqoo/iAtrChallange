import 'package:iatros_challange/core/app_bloc.dart';
import 'package:iatros_challange/services/api/models/task.dart';

class HomeState extends AppState {
  List<Task> tasks;

  HomeState({
    this.tasks,
  });

  HomeState.from(HomeState state) {
    error = state.error;
    busy = state.busy;
    tasks = state.tasks;
  }
}
