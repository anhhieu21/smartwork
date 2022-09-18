import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/repository/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService _categoryService;
  CategoryCubit(this._categoryService) : super(CategoryInitial());

  void getCategory() async {
    final list = _categoryService.getListCategory();
    emit(CategoryData(list));
  }

  void addCategory(Category category) async {
    _categoryService.addCategory(category);
    getCategory();
  }

  void updateCategory(String category) {
    _categoryService.updateCategory(category);
    getCategory();
  }

  void removeCategory(int index) async {
    _categoryService.removeCategory(index);
    getCategory();
  }
}
