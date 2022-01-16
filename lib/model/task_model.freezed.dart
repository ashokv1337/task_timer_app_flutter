// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
class _$TaskModelTearOff {
  const _$TaskModelTearOff();

  _TaskModel call(
      {String? taskTitle,
      String? taskDescription,
      int? taskEndHour,
      int? taskEndMinutes}) {
    return _TaskModel(
      taskTitle: taskTitle,
      taskDescription: taskDescription,
      taskEndHour: taskEndHour,
      taskEndMinutes: taskEndMinutes,
    );
  }

  TaskModel fromJson(Map<String, Object?> json) {
    return TaskModel.fromJson(json);
  }
}

/// @nodoc
const $TaskModel = _$TaskModelTearOff();

/// @nodoc
mixin _$TaskModel {
  String? get taskTitle => throw _privateConstructorUsedError;
  String? get taskDescription => throw _privateConstructorUsedError;
  int? get taskEndHour => throw _privateConstructorUsedError;
  int? get taskEndMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res>;
  $Res call(
      {String? taskTitle,
      String? taskDescription,
      int? taskEndHour,
      int? taskEndMinutes});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  final TaskModel _value;
  // ignore: unused_field
  final $Res Function(TaskModel) _then;

  @override
  $Res call({
    Object? taskTitle = freezed,
    Object? taskDescription = freezed,
    Object? taskEndHour = freezed,
    Object? taskEndMinutes = freezed,
  }) {
    return _then(_value.copyWith(
      taskTitle: taskTitle == freezed
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDescription: taskDescription == freezed
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      taskEndHour: taskEndHour == freezed
          ? _value.taskEndHour
          : taskEndHour // ignore: cast_nullable_to_non_nullable
              as int?,
      taskEndMinutes: taskEndMinutes == freezed
          ? _value.taskEndMinutes
          : taskEndMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
          _TaskModel value, $Res Function(_TaskModel) then) =
      __$TaskModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? taskTitle,
      String? taskDescription,
      int? taskEndHour,
      int? taskEndMinutes});
}

/// @nodoc
class __$TaskModelCopyWithImpl<$Res> extends _$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(_TaskModel _value, $Res Function(_TaskModel) _then)
      : super(_value, (v) => _then(v as _TaskModel));

  @override
  _TaskModel get _value => super._value as _TaskModel;

  @override
  $Res call({
    Object? taskTitle = freezed,
    Object? taskDescription = freezed,
    Object? taskEndHour = freezed,
    Object? taskEndMinutes = freezed,
  }) {
    return _then(_TaskModel(
      taskTitle: taskTitle == freezed
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDescription: taskDescription == freezed
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      taskEndHour: taskEndHour == freezed
          ? _value.taskEndHour
          : taskEndHour // ignore: cast_nullable_to_non_nullable
              as int?,
      taskEndMinutes: taskEndMinutes == freezed
          ? _value.taskEndMinutes
          : taskEndMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel implements _TaskModel {
  _$_TaskModel(
      {this.taskTitle,
      this.taskDescription,
      this.taskEndHour,
      this.taskEndMinutes});

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  final String? taskTitle;
  @override
  final String? taskDescription;
  @override
  final int? taskEndHour;
  @override
  final int? taskEndMinutes;

  @override
  String toString() {
    return 'TaskModel(taskTitle: $taskTitle, taskDescription: $taskDescription, taskEndHour: $taskEndHour, taskEndMinutes: $taskEndMinutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskModel &&
            const DeepCollectionEquality().equals(other.taskTitle, taskTitle) &&
            const DeepCollectionEquality()
                .equals(other.taskDescription, taskDescription) &&
            const DeepCollectionEquality()
                .equals(other.taskEndHour, taskEndHour) &&
            const DeepCollectionEquality()
                .equals(other.taskEndMinutes, taskEndMinutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskTitle),
      const DeepCollectionEquality().hash(taskDescription),
      const DeepCollectionEquality().hash(taskEndHour),
      const DeepCollectionEquality().hash(taskEndMinutes));

  @JsonKey(ignore: true)
  @override
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(this);
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {String? taskTitle,
      String? taskDescription,
      int? taskEndHour,
      int? taskEndMinutes}) = _$_TaskModel;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  String? get taskTitle;
  @override
  String? get taskDescription;
  @override
  int? get taskEndHour;
  @override
  int? get taskEndMinutes;
  @override
  @JsonKey(ignore: true)
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
