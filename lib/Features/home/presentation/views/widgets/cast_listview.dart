import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_list_item.dart';
import 'package:photoplay/core/widgets/error_view.dart';
import 'package:photoplay/core/utils/styles.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: Styles.text15b,
          ),
          const SizedBox(
            height: 12.0,
          ),

          //cast list view
          BlocBuilder<CastCubit, CastStates>(
            builder: (context, state) {
              if (state is GetMovieCastSuccessState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.21,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieCast.length,
                    itemBuilder: (context, index) {
                      return CastListItem(
                        movieCast: state.movieCast[index],
                      );
                    },
                  ),
                );
              } else if (state is GetMovieCastFailureState) {
                return ErrorView(
                  errMessage: state.errMessage,
                  onPressed: () {
                    BlocProvider.of<CastCubit>(context)
                        .getMovieCast(movieId: movieId);
                  },
                );
              } else if (state is GetMovieCastLoadingState) {
                return const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
