import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';
import 'package:smartwork/view/widgets/custom_textfield.dart';

class LabelCategory extends StatelessWidget {
  final bool isSeeAll;
  LabelCategory({super.key, required this.isSeeAll});
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Category Task',
                style: textStyleGoogle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  _addTask(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: colorItemDay,
                      boxShadow: const [
                        BoxShadow(
                            color: colorShadown,
                            offset: Offset(4, 4),
                            blurRadius: 10.0)
                      ]),
                  child: const Icon(
                    Ionicons.add,
                    color: colorWhite,
                  ),
                ),
              ),
            ],
          ),
          if (isSeeAll)
            InkWell(
              onTap: () {},
              child: Text(
                'See all',
                textAlign: TextAlign.end,
                style: textStyleGoogle.copyWith(fontSize: 14, color: colorGrey),
              ),
            ),
        ],
      ),
    );
  }

  _addTask(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: SizedBox(
                height: size.width / 2,
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Text(
                        'Add category',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: titleController, label: 'Title'),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(_),
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: colorConfirm),
                            child: const Icon(
                              Ionicons.close,
                              color: colorWhite,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Category category =
                                  Category(titleController.text, '');
                              BlocProvider.of<CategoryCubit>(context)
                                  .addCategory(category);
                              Navigator.pop(_);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: colorConfirm),
                            child: const Icon(
                              Ionicons.checkmark,
                              color: colorWhite,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
