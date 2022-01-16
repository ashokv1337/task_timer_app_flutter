import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_model.freezed.dart';
part 'task_model.g.dart';
// class TaskModel {
//   String? taskTitle;
//   String? taskDescription;

//   TaskModel({this.taskTitle, this.taskDescription, this.time});
// }

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    String? taskTitle,
    String? taskDescription,
    int? taskEndHour,
    int? taskEndMinutes,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
