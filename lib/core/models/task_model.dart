import 'dart:convert';

class TaskModel {
  int? id;
  String? title;
  String? description;
  bool? isHighPriority;
  bool? isCompleted;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.isHighPriority,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isHighPriority: json['isHighPriority'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isHighPriority': isHighPriority,
      'isCompleted': isCompleted,
    };
  }

  static String encodeTasks(List<TaskModel> tasks) =>
      json.encode(tasks.map((task) => task.toJson()).toList());

  static List<TaskModel> decodeTasks(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map((e) => TaskModel.fromJson(e))
          .toList();
}
