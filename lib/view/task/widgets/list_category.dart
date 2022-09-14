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
  final Function callback;
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
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: DropdownSearch<Category>(
                    onChanged: (value) => widget.callback(value?.title),
                    popupProps: PopupProps.menu(
                      menuProps: MenuProps(
                        shadowColor: colorGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      itemBuilder: (context, item, isSelected) => Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          item.title,
                          style: textStyleGoogle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    itemAsString: (category) => category.title,
                    items: state.categorys,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: colorGrey.shade200,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
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
