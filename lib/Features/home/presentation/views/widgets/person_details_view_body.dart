import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/known_for_cubit/known_for_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_details_image.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/widgets/error_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/known_for_listview.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';

class PersonDetailsViewBody extends StatefulWidget {
  const PersonDetailsViewBody({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<PersonDetailsViewBody> createState() => _PersonDetailsViewBodyState();
}

class _PersonDetailsViewBodyState extends State<PersonDetailsViewBody> {
  @override
  void initState() {
    BlocProvider.of<CastCubit>(context).getCastDetails(castId: widget.id);
    BlocProvider.of<KnownForCubit>(context).getKnownForList(castId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;

    return SafeArea(
      child: BlocBuilder<CastCubit, CastStates>(
        builder: (context, state) {
          if (state is GetCastDetailsSuccessState) {
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //actor image
                    CastDetailsImage(
                      imagePath: state.castDetails.profilePath,
                    ),

                    //back button
                    const DefaultBackBtn(),

                    //actor name
                    Positioned(
                      bottom: -22.0,
                      left: 40.0,
                      right: 40.0,
                      child: Text(
                        state.castDetails.name,
                        style: Styles.text37.copyWith(
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 56,
                ),

                //details(desc,knownForList)
                Expanded(
                  child: CupertinoScrollbar(
                    thumbVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.left,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          //actor desc
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              state.castDetails.biography!,
                              style: isDarkTheme
                                  ? Styles.text15bk
                                  : Styles.text15bk.copyWith(
                                      color: const Color(0xff7E7E7E),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),

                          // Known For List View
                          BlocBuilder<KnownForCubit, KnownForStates>(
                            builder: (context, state) {
                              if (state is GetKnownForListSuccessState) {
                                if (state.movies.isNotEmpty) {
                                  return KnownForListView(movies: state.movies);
                                }
                              } else if (state is GetKnownForListFailureState) {
                                return ErrorView(
                                  errMessage: state.errMessage,
                                  onPressed: () {
                                    BlocProvider.of<KnownForCubit>(context)
                                        .getKnownForList(castId: widget.id);
                                  },
                                );
                              } else if (state is GetKnownForListLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetCastDetailsFailureState) {
            return ErrorView(
              errMessage: state.errMessage,
              onPressed: () {
                BlocProvider.of<CastCubit>(context)
                    .getCastDetails(castId: widget.id);
              },
            );
          } else if (state is GetCastDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
