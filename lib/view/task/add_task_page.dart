import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/contants/tag.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/cubit/index.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/view/task/widgets/list_category.dart';
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
  String? tag;
  late String category;
  _addTask() {
    Task item = Task(titleController.text, contentController.text,
        DateTime.now(), tag ?? 'doing', category);
    BlocProvider.of<TaskCubit>(context).addTask(item);
    BlocProvider.of<CategoryCubit>(context).updateCategory(category);
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
                                  backgroundColor: colorGrey,
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
                  callback: (value) => setState(() {
                        category = value;
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
