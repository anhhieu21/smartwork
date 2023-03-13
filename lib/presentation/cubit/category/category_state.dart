part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryData extends CategoryState {
  final List<Category> categorys;

  const CategoryData(this.categorys);
  @override
  List<Object> get props => [categorys];
}
