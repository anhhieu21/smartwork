import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  String createdAt;

  @HiveField(3)
  String tag;
  Task(
     this.title,
     this.content,
     this.createdAt,
     this.tag,
 );
}
