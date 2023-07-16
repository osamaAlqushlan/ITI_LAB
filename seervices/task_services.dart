import 'package:dio/dio.dart';

import '../models/task_model.dart';

class TaskServices {
  String task_url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasksList = [];
    final dio = Dio();
    final response = await dio.get(task_url);
    var data = response.data;
    data.forEach((jsonElement) {
      TaskModel task = TaskModel.fromJson(jsonElement);
      tasksList.add(task);
    });
    return tasksList;
  }
}
