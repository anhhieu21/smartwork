import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:smartwork/cubit.dart';
import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/routes/routes_path.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/styles/text.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryData) {
          return SizedBox(
            height: size.width / 2,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(state.categorys.length, (index) {
                return ItemCategory(
                  item: state.categorys[index],
                  index: index,
                  length: state.categorys.length,
                );
              }),
            ),
          );
        } else {
          return const ItemCategory();
        }
      },
    );
  }
}

class ItemCategory extends StatelessWidget {
  final Category? item;

  final int? index;
  final int? length;
  const ItemCategory({super.key, this.item, this.index, this.length});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RoutePath.taskByCategory, arguments: item!.title);
        },
        child: Container(
          width: size.width / 2,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: colorWhite,
              boxShadow: const [
                BoxShadow(
                    color: colorShadown, offset: Offset(4, 4), blurRadius: 10.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.laptop,
                  color: colorWork,
                  size: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item?.title ?? '',
                        style: textStyleGoogle.copyWith(fontSize: 18),
                      ),
                    ),
                    Icon(
                      Ionicons.chevron_forward,
                      color: colorGrey.shade600,
                    ),
                  ],
                ),
                Text(
                  '${item?.qty} Task',
                  style: textStyleGoogle.copyWith(color: colorGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
