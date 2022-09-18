import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemCategories extends StatelessWidget {
  final Category item;
  final int index;
  const ItemCategories({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: _renameCategory(),
              icon: Ionicons.pencil,
              backgroundColor: colorDone,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            ),
            SlidableAction(
              onPressed: _removeCategory,
              icon: Ionicons.trash,
              backgroundColor: colorRed,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: colorWhite,
              boxShadow: const [
                BoxShadow(
                    color: colorShadown, offset: Offset(4, 4), blurRadius: 10.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Ionicons.laptop,
                  color: colorWork,
                  size: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: textStyleGoogle.copyWith(fontSize: 18),
                        ),
                        Text(
                          '${item.qty} Task',
                          style: textStyleGoogle.copyWith(color: colorGrey),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Ionicons.chevron_forward,
                  color: colorGrey.shade600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renameCategory() {}

  void _removeCategory(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).removeCategory(index);
  }
}
