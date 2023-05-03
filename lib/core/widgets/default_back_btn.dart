import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class DefaultBackBtn extends StatelessWidget {
  const DefaultBackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                'BACK',
                style: Styles.text14b.copyWith(
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
