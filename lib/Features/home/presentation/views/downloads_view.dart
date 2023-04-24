import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/downloaded_item.dart';

class DownloadsView extends StatelessWidget {
  const DownloadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const DownloadedItem();
          }),
    );
  }
}
