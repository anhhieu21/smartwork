import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/utils/formatter.dart';
import 'package:smartwork/view.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TitleCubit, TitleState>(
      builder: (context, state) {
        if (state is TitleDateTime) {
          return Row(
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 65,
              ),
              const SizedBox(
                width: 10,
              ),
              Trading(
                isNight: state.isNight,
                sessionsDay: state.sessionsDay,
                timeNow: state.dateNow,
              )
            ],
          );
        } else {
          return Row(
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 65,
              ),
              const SizedBox(
                width: 10,
              ),
              const Trading(
                isNight: false,
              )
            ],
          );
        }
      },
    );
  }
}

class Trading extends StatelessWidget {
  final bool isNight;
  final String? sessionsDay;
  final DateTime? timeNow;
  const Trading({
    Key? key,
    required this.isNight,
    this.sessionsDay,
    this.timeNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Formatter.hour(timeNow ?? DateTime.now()),
                ),
                Icon(
                  !isNight ? Ionicons.sunny : Ionicons.cloudy_night,
                  color: !isNight ? colorSun : colorNight,
                )
              ],
            ),
            Text(sessionsDay ?? 'Good ...'),
          ],
        ),
      ),
    );
  }
}
