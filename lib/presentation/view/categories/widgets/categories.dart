import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/cubit.dart';
import 'package:smartwork/view.dart';

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
