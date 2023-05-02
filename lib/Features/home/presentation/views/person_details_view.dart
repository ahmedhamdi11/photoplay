import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/person_details_view_body.dart';

class PersonDetailsView extends StatelessWidget {
  const PersonDetailsView({
    super.key,
    required this.castId,
  });
  final int castId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonDetailsViewBody(
        id: castId,
      ),
    );
  }
}
