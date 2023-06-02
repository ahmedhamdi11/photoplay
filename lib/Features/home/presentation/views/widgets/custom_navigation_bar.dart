import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return SizedBox(
          height: 65,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kPrimatyColor,
              selectedFontSize: 11,
              unselectedFontSize: 8,
              iconSize: 22,
              currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
              onTap: (value) => BlocProvider.of<HomeCubit>(context)
                  .changeBNavigationBar(index: value),
              items: const [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(FontAwesomeIcons.houseChimney),
                    ),
                    label: 'HOME'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(FontAwesomeIcons.magnifyingGlass),
                    ),
                    label: 'SEARCH'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(FontAwesomeIcons.solidHeart),
                    ),
                    label: 'FAVORITES'),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Icon(FontAwesomeIcons.solidUser),
                  ),
                  label: 'PROFILE',
                ),
              ]),
        );
      },
    );
  }
}
