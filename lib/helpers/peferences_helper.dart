import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  String tag = "B=B PreferencesHelper";
  static SharedPreferences? sharedPreferences;
  Logger logger = Logger();

  String TASK_LIST = "TASK_LIST";

  init() async {
    logger.d('$tag  init.start');
    //SharedPreferences?.setMockInitialValues({});
    try {
      sharedPreferences ??= await SharedPreferences?.getInstance();
    } catch (e) {
      logger.d('$tag  init.Exception = ${e.toString()}');
    }

    logger.d('$tag  init $sharedPreferences');
    logger.d('$tag  init.end');
  }

  String? getTaskList() {
    logger.d('$tag  getTaskList.start');
    String? taskList = sharedPreferences?.getString(TASK_LIST);

    logger.d('$tag  getTaskList  $taskList');
    logger.d('$tag  getTaskList.end');
    return taskList;
  }

  Future<String> updateTaskList(String? taskList) async {
    logger.d('$tag  updateTaskList.start');
    await sharedPreferences?.setString(TASK_LIST, taskList!);

    logger.d('$tag  updateTaskList.end');
    return Future.value(taskList);
  }
}
