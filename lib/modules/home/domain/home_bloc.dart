import 'package:iatros_challange/core/app_bloc.dart';
import 'package:iatros_challange/modules/home/domain/home_events.dart';
import 'package:iatros_challange/services/api/task_service.dart';

import 'home_state.dart';

class HomeBloc extends AppBloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeTaskFetch) {
      yield HomeState.from(state)..busy = true;

      try {
        var tasks = await TaskService.getTasks();

        var now = DateTime.now();

        yield HomeState.from(state)
          ..busy = false
          ..tasks = tasks
              .where((element) =>
                  element.dueDate.difference(now).inDays == 0 &&
                  element.dueDate.day == now.day &&
                  element.completedAd == null)
              .toList()
          ..errorFatal = false;
      } catch (e) {
        yield HomeState.from(state)
          ..busy = false
          ..error = e
          ..errorFatal = true;
      }
    } else if (event is MarkTaskAsDone) {
      //TODO here should be logic for updating the task in the backend

      var tasks = state.tasks;
      tasks.remove(event.task);

      yield HomeState.from(state)..tasks = tasks;
    }
  }
}
