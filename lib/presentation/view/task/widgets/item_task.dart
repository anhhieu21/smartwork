import 'package:flutter/material.dart';

import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/styles/text.dart';

class ItemTask extends StatelessWidget {
  final Task item;
  const ItemTask({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: colorShadown,
                  offset: Offset(5, 8),
                  blurRadius: 8.0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(
                height: 10,
              ),
              Text(item.content),
              Text(
                'tag: ${item.category}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              // Text(item.createdAt),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: item.tag == 'doing' ? colorDoing : colorDone,
                ),
                child: Text(item.tag,
                    style: textStyleGoogle.copyWith(
                        color: colorWhite, fontSize: 12)),
              )
            ],
          )),
    );
  }
}
