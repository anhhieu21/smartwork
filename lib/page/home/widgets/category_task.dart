import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 2,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(4, (index) => const ItemCategory()),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
                      'Work for home',
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
                '12 Task',
                style: textStyleGoogle.copyWith(color: colorGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
