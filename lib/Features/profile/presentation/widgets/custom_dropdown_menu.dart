import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<Widget> children;
  final bool expand;

  const CustomDropdownMenu({
    super.key,
    this.expand = false,
    required this.children,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenu();
}

class _CustomDropdownMenu extends State<CustomDropdownMenu>
    with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void didUpdateWidget(CustomDropdownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation!,
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: isDarkTheme ? kDarkDropdownColor : kLightDropdownColor,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey)),
            child: Column(children: widget.children),
          );
        },
      ),
    );
  }
}
