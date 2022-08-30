import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:smartwork/styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgPage,
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: colorItemNav,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Solomon Ares'),
                  Text('Good morning'),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.notifications_outline))
        ],
      ),
      body: const Center(
        child: Text('Empty'),
      ),
    );
  }
}
