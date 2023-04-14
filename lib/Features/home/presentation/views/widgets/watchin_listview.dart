import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watching_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class WatchingListView extends StatelessWidget {
  const WatchingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watching',
            style: Styles.text15b,
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => const WatchingListItem(),
            ),
          ),
        ],
      ),
    );
  }
}
