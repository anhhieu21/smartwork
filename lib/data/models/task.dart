import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

enum Sort { latest, oldest }

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  String tag;

  @HiveField(4)
  String? category;
  Task(this.title, this.content, this.createdAt, this.tag, this.category);
}
