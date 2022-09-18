import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/app/app_cubit.dart';

import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  _syncData() {}

  _darkMode(BuildContext context, bool value) {
    BlocProvider.of<AppCubit>(context).darkMode(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            ItemMenu(
              onTap: _syncData,
              title: 'Sync',
              trailing: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Ionicons.cloud_upload,
                  color: colorConfirm,
                  size: 30,
                ),
              ),
            ),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is AppTheme) {
                  return ItemMenu(
                    title: 'Dark mode',
                    trailing: Switch(
                        value: state.isDark,
                        onChanged: (value) => _darkMode(context, value)),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            SvgPicture.asset(
              'assets/icons/logo.svg',
              width: 50,
            ),
            const Text('version 1.0.0'),
          ],
        )),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  final Widget trailing;
  final String title;
  final Function()? onTap;
  const ItemMenu({
    Key? key,
    required this.trailing,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: textStyleGoogle,
      ),
      trailing: trailing,
    );
  }
}
