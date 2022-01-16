// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      taskTitle: json['taskTitle'] as String?,
      taskDescription: json['taskDescription'] as String?,
      taskEndHour: json['taskEndHour'] as int?,
      taskEndMinutes: json['taskEndMinutes'] as int?,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'taskTitle': instance.taskTitle,
      'taskDescription': instance.taskDescription,
      'taskEndHour': instance.taskEndHour,
      'taskEndMinutes': instance.taskEndMinutes,
    };
