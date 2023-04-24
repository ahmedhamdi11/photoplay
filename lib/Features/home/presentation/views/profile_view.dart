import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/custom_profile_btn.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/functions/show_loading_alert.dart';
import 'package:photoplay/core/utils/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
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
          showCustomSnackBar(
            context: context,
            content: state.success,
            backgroundColor: kPrimatyColor,
          );
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
                  CircleAvatar(
                    radius: 72,
                    backgroundColor: kPrimatyColor,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: const Color(0xff1D1D1D),
                      backgroundImage: currentUser?.photoURL != null
                          ? NetworkImage(currentUser!.photoURL!)
                          : null,
                      child: currentUser!.photoURL == null
                          ? SvgPicture.asset('assets/images/person.svg')
                          : null,
                    ),
                  ),
                  const SizedBox(height: 18),

                  //user name
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      currentUser.displayName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Styles.text27,
                    ),
                  ),
                  const SizedBox(height: 70),

                  ///////////
                  const CustomProfileButton(
                      text: 'Account', icon: FontAwesomeIcons.solidUser),
                  const Divider(color: Colors.white),
                  const CustomProfileButton(
                      text: 'Notifications', icon: FontAwesomeIcons.solidBell),
                  const Divider(color: Colors.white),
                  const CustomProfileButton(
                      text: 'Settings', icon: FontAwesomeIcons.gear),
                  const Divider(color: Colors.white),
                  const CustomProfileButton(
                      text: 'Help', icon: FontAwesomeIcons.circleInfo),
                  const Divider(color: Colors.white),
                  CustomProfileButton(
                      onTap: () {
                        BlocProvider.of<SignOutCubit>(context).signOut();
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
}
