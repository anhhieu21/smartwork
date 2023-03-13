import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/cubit.dart';
import 'package:smartwork/view.dart';

const urlAvatar =
    'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryData) {
          return ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(state.categorys.length, (index) {
              return SizedBox(
                child: ItemCategories(
                  item: state.categorys[index],
                  index: index,
                ),
              );
            }),
          );
        } else {
          return const ItemCategory();
        }
      },
    );
  }
}
