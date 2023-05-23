import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage defaultTransitionPage({
  required LocalKey key,
  Offset? beginOffset,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position:
            Tween(begin: beginOffset ?? const Offset(1, 0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastEaseInToSlowEaseOut)),
        child: child,
      );
    },
  );
}
