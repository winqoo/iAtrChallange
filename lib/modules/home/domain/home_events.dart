import 'package:iatros_challange/services/api/models/task.dart';

class HomeEvent {}

class HomeTaskFetch extends HomeEvent {}

class MarkTaskAsDone extends HomeEvent {
  final Task task;
  final DateTime dateTime;

  MarkTaskAsDone({
    this.task,
    this.dateTime,
  });
}
