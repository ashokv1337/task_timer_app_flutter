import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_timer_app_flutter/helpers/peferences_helper.dart';
import 'package:task_timer_app_flutter/model/task_model.dart';
import 'package:task_timer_app_flutter/res/strings.dart';
import 'package:task_timer_app_flutter/widgets/add_task_bottomsheet_widget.dart';
import 'package:task_timer_app_flutter/widgets/task_widget.dart';
import 'package:logger/logger.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> taskList = [];
  Logger logger = Logger();
  void addNewTaskDialog() {
    // await showDialog(
    //     context: context,
    //     builder: (context) => const AddTaskBottomSheetWidget());
  }

  PreferencesHelper preferencesHelper = PreferencesHelper();

  void getTaskList() {
    logger.d('getTaskList.START');
    if (PreferencesHelper.sharedPreferences != null) {
      String? taskListString = preferencesHelper.getTaskList();
      if (taskListString != null) {
        List<dynamic> tempList = json.decode(taskListString);
        for (var element in tempList) {
          TaskModel taskModel = TaskModel.fromJson(element);
          taskList.add(taskModel);
        }
        // taskList.clear();
        // taskList.addAll(tempList);
        if (mounted) {
          setState(() {});
        }
        logger.d('List Length = ${taskList.length}');
      }
    }
    logger.d('getTaskList.END');
  }

  _initializePreferencesHelper() async {
    await preferencesHelper.init();

    logger.d(
        "PreferencesHelper.sharedPreferences = ${PreferencesHelper.sharedPreferences}");
    getTaskList();
  }

  @override
  void initState() {
    // taskList.add(TaskModel(
    //     taskDescription: 'Needs to complete bank work',
    //     taskTitle: 'Bank Task',
    //     taskEndHour: 16,
    //     taskEndMinutes: 12));
    // taskList.add(TaskModel(
    //     taskDescription: 'Meeting at 4PM',
    //     taskTitle: 'Meeting',
    //     taskEndHour: 16,
    //     taskEndMinutes: 13));

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (PreferencesHelper.sharedPreferences == null) {
        _initializePreferencesHelper();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              taskModel: taskList[index],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TaskModel taskModel = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const AddTaskBottomSheetWidget(),
            ),
          );
          if (mounted) {
            setState(() {
              taskList.add(taskModel);
            });
          }

          //getTaskList();
          // .then((value) => () {
          //       if (value != null) {
          //         getTaskList();
          //       } else {
          //         logger.d('Returned value is null');
          //       }
          //     });
        },
        tooltip: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
