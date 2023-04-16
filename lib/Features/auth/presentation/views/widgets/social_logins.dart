import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/social_signin_cubit/social_signin_cubit.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/functions/show_loading_alert.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialSignInCubit, SocialSignInStates>(
      listener: (context, state) {
        if (state is GoogleSignInLoadingState) {
          showLoadingAlert(context: context, isLoading: true);
        } else {
          showLoadingAlert(context: context, isLoading: false);
        }
        if (state is GoogleSignInSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.homeViewPath);
        } else if (state is GoogleSignInFailureState) {
          showCustomSnackBar(
              context: context,
              content: state.errMessage,
              backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    endIndent: 16.0,
                    color: Colors.white.withOpacity(0.36),
                  ),
                ),
                Text(
                  'Social Logins',
                  style: Styles.text14m,
                ),
                Expanded(
                  child: Divider(
                    indent: 16.0,
                    color: Colors.white.withOpacity(0.36),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/images/Facebook button.svg'),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SocialSignInCubit>(context)
                        .signInWithGoogle();
                  },
                  child: SvgPicture.asset('assets/images/Google button.svg'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
