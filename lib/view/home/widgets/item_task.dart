import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:smartwork/models/task.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class ItemTask extends StatelessWidget {
  final Task? item;
  const ItemTask({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: size.width / 2.2,
            width: size.width / 1.5,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: colorWhite,
                boxShadow: const [
                  BoxShadow(
                      color: colorShadown,
                      offset: Offset(6, 6),
                      blurRadius: 10.0)
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(item?.title ?? 'add',
                            maxLines: 2,
                            style: textStyleGoogle.copyWith(fontSize: 18)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Ionicons.ellipsis_horizontal,
                            color: colorGrey,
                          ))
                    ],
                  ),
                  Text(item?.content ?? '',
                      style: textStyleGoogle.copyWith(color: colorGrey)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Ionicons.calendar_outline,
                        color: colorGrey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Text(item?.createdAt ?? '',
                      //     style: textStyleGoogle.copyWith(color: colorGrey)),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: item!.tag == 'doing' ? colorDoing : colorDone,
                    ),
                    child: Text(item?.tag ?? '',
                        style: textStyleGoogle.copyWith(
                            color: colorWhite, fontSize: 12)),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 20,
              width: 5,
              height: 50,
              child: Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: item!.tag == 'doing' ? colorDoing : colorDone,
                ),
              ))
        ],
      ),
    );
  }
}
