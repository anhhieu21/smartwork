import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/routes/routes_path.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/styles/text.dart';
import 'package:smartwork/presentation/utils/formatter.dart';
import 'package:smartwork/presentation/view/home/home_page.dart';
import 'package:smartwork/presentation/view/widgets/on_tap_effect.dart';

class ItemTask extends StatelessWidget {
  final Task? item;
  const ItemTask({
    Key? key,
    this.item,
  }) : super(key: key);
  _onTap(BuildContext context, Task task) {
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
        screen: HomePage(),
        settings: const RouteSettings(name: RoutePath.home));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: size.width / 2.2,
            constraints: BoxConstraints(maxWidth: size.width / 1.5),
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
            child: OntapEffect(
              radius: 20,
              callback: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
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
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: textStyleGoogle.copyWith(color: colorGrey)),
                    const Spacer(),
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
                        Expanded(
                          child: Text(Formatter.dateTime(item!.createdAt),
                              style:
                                  textStyleGoogle.copyWith(color: colorGrey)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color:
                                item!.tag == 'doing' ? colorDoing : colorDone,
                          ),
                          child: Text(item?.tag ?? '',
                              style: textStyleGoogle.copyWith(
                                  color: colorWhite, fontSize: 12)),
                        )
                      ],
                    ),
                  ],
                ),
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
