import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';
import 'package:dropdown_search/dropdown_search.dart';

typedef StringCallback = void Function(String val);

class ListCategory extends StatefulWidget {
  final StringCallback callback;
  const ListCategory({super.key, required this.callback});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryData) {
          return Row(
            children: [
              Text('Category :',
                  style: textStyleGoogle.copyWith(color: colorGrey)),
              const SizedBox(
                width: 5,
              ),
              // ListView(
              //   shrinkWrap: true,

              //   // spacing: 10,
              //   // runSpacing: 3.0,
              //   children: List.generate(state.categorys.length, (index) {
              //     final item = state.categorys[index];
              //     return ChoiceChip(
              //       label: Text(item.title),
              //       selected: (selectIndex == index),
              //       selectedColor: colorDone,
              //       onSelected: (value) {
              //         setState(() {
              //           selectIndex = index;
              //           widget.callback(item.title);
              //         });
              //       },
              //     );
              //   }),
              // ),
              DropdownSearch<Category>(
                popupProps: PopupProps.menu(
                  // showSelectedItems: true,
                  disabledItemFn: (Category s) => s.title.startsWith('U'),
                ),
                items: state.categorys,
                dropdownBuilder: (context, selectedItem) {
                  return Text('data');
                },
                onChanged: print,
              ),
            ],
          );
        } else {
          return IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.add_circle),
          );
        }
      },
    );
  }
}
