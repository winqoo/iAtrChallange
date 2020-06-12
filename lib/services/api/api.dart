import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:iatros_challange/services/api/models/task.dart';

typedef RequestMaker = Future<http.Response> Function();

class Api {
  static String apiBaseUrl = 'https://run.mocky.io/v3/';
  static String tasksEndpoint = '3e31ab8c-38f8-4510-babd-42aaa155ba78';

  static Future<List<Task>> getTasks() async {
    var response = await http.get(Uri.parse('$apiBaseUrl$tasksEndpoint'));
    if (response.statusCode == HttpStatus.ok) {
      return ((json.decode(response.body)) as List)
          .map((e) => Task.fromJson(e))
          .toList();
    } else {
      throw Exception('Problem loading data');
    }
  }
}
