import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class LabelCategory extends StatelessWidget {
  const LabelCategory({super.key});

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
                  Category category = Category('Update cubit ', '4');
                  BlocProvider.of<CategoryCubit>(context).addCategory(category);
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
}
