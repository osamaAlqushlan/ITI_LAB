import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../seervices/task_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<TaskModel> tasks = [];
  bool isLoading = true;
  getTasks() async {
    tasks = await TaskServices().getTasks();
    isLoading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getTasks();
  }

  String iscompleted(bool? compelet) {
    if (compelet == true) {
      return "colpleted";
    } else {
      return "not completed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(tasks[index].id.toString()),
              title: Text(tasks[index].title ?? "--"),
              subtitle: Text(iscompleted(tasks[index].completed)),
            );
          }),
    );
  }
}
