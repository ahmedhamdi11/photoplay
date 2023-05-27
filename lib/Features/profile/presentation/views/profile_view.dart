import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:photoplay/Features/profile/presentation/widgets/custom_profile_btn.dart';
import 'package:photoplay/Features/profile/presentation/widgets/profile_image.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/functions/show_loading_alert.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    SignOutCubit signOutCubit = BlocProvider.of<SignOutCubit>(context);
    return BlocConsumer<SignOutCubit, SignOutStates>(
      listener: (context, state) {
        if (state is SignOutLoadingState) {
          showLoadingAlert(context: context, isLoading: true);
        } else {
          showLoadingAlert(context: context, isLoading: false);
        }
        if (state is SignOutFailureState) {
          showCustomSnackBar(
            context: context,
            content: state.errMessage,
            backgroundColor: Colors.red,
          );
        } else if (state is SignOutSuccessState) {
          GoRouter.of(context).pushReplacement('/');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 60,
                  ),

                  //user image
                  ProfileImage(
                    photoUrl: currentUser!.photoURL,
                  ),
                  const SizedBox(height: 18),

                  //user name
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      currentUser.displayName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Styles.text27,
                    ),
                  ),
                  const SizedBox(height: 70),

                  ///////////
                  // Account button
                  const CustomProfileButton(
                    text: 'Account',
                    icon: FontAwesomeIcons.solidUser,
                  ),

                  const Divider(color: Colors.white),

                  //Novification button
                  const CustomProfileButton(
                    text: 'Notifications',
                    icon: FontAwesomeIcons.solidBell,
                  ),

                  const Divider(color: Colors.white),

                  //Settings button
                  CustomProfileButton(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.settingsViewPath);
                    },
                    text: 'Settings',
                    icon: FontAwesomeIcons.gear,
                  ),

                  const Divider(color: Colors.white),

                  //help button
                  const CustomProfileButton(
                    text: 'Help',
                    icon: FontAwesomeIcons.circleInfo,
                  ),

                  const Divider(color: Colors.white),

                  //logout button
                  CustomProfileButton(
                      onTap: () {
                        logout(context, signOutCubit);
                      },
                      text: 'Logout',
                      icon: FontAwesomeIcons.rightFromBracket),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> logout(BuildContext context, SignOutCubit signOutCubit) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding:
            const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              signOutCubit.signOut();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
