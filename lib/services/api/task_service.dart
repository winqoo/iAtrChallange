import 'package:iatros_challange/services/api/api.dart';
import 'package:iatros_challange/services/api/models/task.dart';

class TaskService {
  static Future<List<Task>> getTasks() {
    return Api.getTasks();
  }
}
