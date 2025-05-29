import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class SharedPrefHelper {
  static const String _userNameKey = 'userName';
  static const String _myTasksKey = 'myTasks';

  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name.trim());
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  static Future<void> clearUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
  }


  static Future<void> addTask(TaskModel task) async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString(_myTasksKey);

    List<TaskModel> tasks = tasksString != null
        ? TaskModel.decodeTasks(tasksString)
        : [];
    task.id = tasks.length + 1;
    tasks.add(task);
    await prefs.setString(_myTasksKey, TaskModel.encodeTasks(tasks));
  }


  static Future<List<TaskModel>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString(_myTasksKey);
    return tasksString != null ? TaskModel.decodeTasks(tasksString) : [];
  }


  static Future<void> clearTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_myTasksKey);
  }

  static Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_myTasksKey, TaskModel.encodeTasks(tasks));
  }


}
