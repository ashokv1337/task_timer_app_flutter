import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_timer_app_flutter/helpers/peferences_helper.dart';
import 'package:task_timer_app_flutter/model/task_model.dart';
import 'package:logger/logger.dart';

class AddTaskBottomSheetWidget extends StatefulWidget {
  const AddTaskBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheetWidget> createState() =>
      _AddTaskBottomSheetWidgetState();
}

class _AddTaskBottomSheetWidgetState extends State<AddTaskBottomSheetWidget> {
  String taskTitle = '';

  String taskDescription = '';

  TimeOfDay? pickedTime;
  Logger logger = Logger();
  late TaskModel taskModel;

  PreferencesHelper preferencesHelper = PreferencesHelper();

  _initializePreferencesHelper() async {
    await preferencesHelper.init();

    logger.d(
        "PreferencesHelper.sharedPreferences = ${PreferencesHelper.sharedPreferences}");
  }

  @override
  void initState() {
    super.initState();
    if (PreferencesHelper.sharedPreferences == null) {
      _initializePreferencesHelper();
    } else {
      logger.d('Already initilaised');
    }
  }

  bool validateData() {
    bool isValid = false;
    isValid = taskTitle.isNotEmpty &&
        taskDescription.isNotEmpty &&
        pickedTime != null;

    return isValid;
  }

  Future<void> saveTask() async {
    if (validateData()) {
      taskModel = TaskModel(
          taskTitle: taskTitle,
          taskDescription: taskDescription,
          taskEndHour: pickedTime!.hour,
          taskEndMinutes: pickedTime!.minute);
      logger.d('New Task Value =  $taskModel');

      if (PreferencesHelper.sharedPreferences != null) {
        String? taskListString = preferencesHelper.getTaskList();
        // if (taskListString != null) {
        List<TaskModel> taskList = [];
        List<dynamic> tempList =
            taskListString != null ? json.decode(taskListString) : [];
        if (tempList.length > 0) {
          for (var element in tempList) {
            TaskModel taskModel = TaskModel.fromJson(element);
            taskList.add(taskModel);
          }
        }

        logger.d('List Length = ${tempList.length}');
        taskList.add(taskModel);
        String newTaskListString = json.encode(taskList);
        logger.d('newTaskListString = $newTaskListString');
        String updatedTaskListString =
            await preferencesHelper.updateTaskList(newTaskListString);
        logger.d('updatedTaskListString = $updatedTaskListString');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task added')));
        await Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).pop(taskModel);
        // }
      } else {
        logger.d(
            'PreferencesHelper.sharedPreferences value =  ${PreferencesHelper.sharedPreferences}');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all the fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Task Title'),
                  TextField(
                    onChanged: (value) => taskTitle = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Task Description'),
                  TextField(
                    onChanged: (value) => taskDescription = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  pickedTime != null
                      ? Text(
                          'Task End Time : ${pickedTime?.hour} : ${pickedTime?.minute}')
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          pickedTime == null
                              ? ElevatedButton(
                                  onPressed: () async {
                                    pickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  },
                                  child: const Text('Select Time'))
                              : ElevatedButton(
                                  onPressed: saveTask,
                                  child: const Text('Save Task'))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
