import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/custom_profile_btn.dart';
import 'package:photoplay/core/utils/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
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
                radius: 70,
                backgroundColor: const Color(0xff1D1D1D),
                backgroundImage: currentUser?.photoURL != null
                    ? NetworkImage(currentUser!.photoURL!)
                    : null,
                child: currentUser!.photoURL == null
                    ? SvgPicture.asset('assets/images/person.svg')
                    : null,
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
              const CustomProfileButton(
                  text: 'Logout', icon: FontAwesomeIcons.rightFromBracket),
            ],
          ),
        ),
      ),
    );
  }
}
