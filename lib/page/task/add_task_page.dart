import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/contants/tag.dart';
import 'package:smartwork/cubit/index.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/page/task/widgets/list_category.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  int selectTag = 0;
  late String tag;
  String string = "Not set yet";
  set _string(String value) => setState(() => string = value);
  _addTask() {
    Task item = Task(
        titleController.text,
        contentController.text,
        DateFormat.yMMMEd().format(DateTime.parse(DateTime.now().toString())),
        tag,
        '');
    BlocProvider.of<TaskCubit>(context).addTask(item);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New task',
          style: textStyleGoogle.copyWith(fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: _addTask,
              icon: const Icon(
                Ionicons.document,
                color: colorItemDay,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Row(
                children: [
                  Text('Tag :',
                      style: textStyleGoogle.copyWith(color: colorGrey)),
                  Wrap(
                    children: List.generate(
                        listTask.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ChoiceChip(
                                  label: Text(listTask[index],
                                      style: textStyleGoogle.copyWith(
                                          color: colorWhite)),
                                  selectedColor: colorDone,
                                  selected: (selectTag == index),
                                  onSelected: (bool value) {
                                    setState(() {
                                      selectTag = index;
                                      tag = listTask[index];
                                    });
                                  },
                                  pressElevation: 3,
                                  selectedShadowColor: colorGrey.shade100),
                            )),
                  )
                ],
              ),
              ListCategory(
                  callback: (category) => setState(() {
                        string = category;
                      })),
              TextField(
                controller: titleController,
                style: textStyleGoogle.copyWith(fontSize: 20),
                decoration: const InputDecoration(
                    labelText: 'Title here', border: InputBorder.none),
              ),
              TextField(
                controller: contentController,
                maxLength: 5000,
                maxLines: null,
                style: textStyleGoogle.copyWith(fontSize: 16),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: 'Content here', border: InputBorder.none),
              )
            ]),
      ),
    );
  }
}
