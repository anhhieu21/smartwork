import 'package:flutter/material.dart';

class OntapEffect extends StatelessWidget {
  final VoidCallback callback;
  final Widget child;
  final double radius;
  const OntapEffect(
      {super.key,
      required this.callback,
      required this.child,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: callback,
        borderRadius: BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
