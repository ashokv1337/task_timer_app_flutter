import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_timer_app_flutter/extensions/timeofday_extenstion.dart';
import 'package:task_timer_app_flutter/model/task_model.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel taskModel;
  const TaskWidget({Key? key, required this.taskModel}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTaskStarted = false;
  String endTimeString = '';
  String remainingTimeString = '';
  TimeOfDay? endTime;
  TimeOfDay? remainingTime;
  int? endTimeInMinutes;
  int? remainingTimeInMinutes;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    endTimeString = widget.taskModel.taskEndHour!.toString() +
        ':' +
        widget.taskModel.taskEndMinutes!.toString();
    endTime = TimeOfDay(
        hour: widget.taskModel.taskEndHour!,
        minute: widget.taskModel.taskEndMinutes!);
    endTimeInMinutes = endTime!.hour * 60 + endTime!.minute;
    remainingTimeInMinutes = endTimeInMinutes! -
        (TimeOfDay.now().hour * 60 + TimeOfDay.now().minute);
    if (endTime!.compareTo(TimeOfDay.now()) > 0) {
      remainingTime = TimeOfDay(
          hour: remainingTimeInMinutes! ~/ 60,
          minute: remainingTimeInMinutes! % 60);
      remainingTimeString = remainingTime!.hour.toString() +
          ':' +
          remainingTime!.minute.toString();
    } else {
      remainingTime = null;
      remainingTimeString = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.taskModel.taskTitle}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.taskModel.taskDescription}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'End Time : $endTimeString',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'Remaining Time : $remainingTimeString',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: remainingTime == null ||
                          remainingTimeInMinutes == 0
                      ? null
                      : () {
                          if (isTaskStarted) {
                            timer?.cancel();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(
                                    'Timer Paused for ${widget.taskModel.taskTitle}')));
                          } else if (remainingTime != null &&
                              remainingTime!.compareTo(TimeOfDay.now()) < 0) {
                            timer = Timer.periodic(
                                Duration(minutes: remainingTimeInMinutes!),
                                (timer) {
                              if (kDebugMode) {
                                print(
                                    'Time Remaining current : $remainingTimeInMinutes');
                                print(
                                    'Time Remaining after: ${remainingTimeInMinutes! - 1}');
                              }

                              if (mounted) {
                                setState(() {
                                  remainingTimeInMinutes =
                                      remainingTimeInMinutes! - 1;
                                  remainingTime = TimeOfDay(
                                      hour: remainingTimeInMinutes! ~/ 60,
                                      minute: remainingTimeInMinutes! % 60);
                                  remainingTimeString =
                                      remainingTime!.hour.toString() +
                                          ':' +
                                          remainingTime!.minute.toString();
                                  if (remainingTimeInMinutes == 0) {
                                    timer.cancel();
                                  }
                                });
                              }
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(
                                    'Timer Started ${widget.taskModel.taskTitle}')));
                          } else {
                            if (mounted) {
                              setState(() {
                                remainingTime = null;
                                remainingTimeString = '0';
                              });
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(
                                    'Time Elapsed ${widget.taskModel.taskTitle}')));
                          }

                          if (mounted) {
                            setState(() {
                              isTaskStarted = !isTaskStarted;
                            });
                          }
                        },
                  icon: Icon(timer != null && isTaskStarted && timer!.isActive
                      ? Icons.pause_circle
                      : Icons.play_circle))
            ],
          )),
    );
  }
}
