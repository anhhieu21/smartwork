import 'package:flutter/material.dart';
import 'package:smartwork/view/categories/widgets/categories.dart';
import 'package:smartwork/view/home/widgets/label_category.dart';

import 'package:smartwork/styles/colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgPage,
      appBar: AppBar(
        title: LabelCategory(),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Categories()),
        ),
      ),
    );
  }
}
