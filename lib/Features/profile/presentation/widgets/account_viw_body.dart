import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/profile/presentation/manager/cubits/cubit/user_account_cubit.dart';
import 'package:photoplay/Features/profile/presentation/widgets/profile_image.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key, required this.isLoading});
  final bool isLoading;
  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  User currentUser = FirebaseAuth.instance.currentUser!;
  String? name;

  @override
  Widget build(BuildContext context) {
    UserAccountCubit userAccountCubit =
        BlocProvider.of<UserAccountCubit>(context);
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const DefaultBackBtn(),
              const Spacer(),
              TextButton(
                onPressed: () {
                  if (name != null) {
                    userAccountCubit.updateUserData(userName: name!);
                  }
                },
                child: const Text('Save'),
              ),
              const SizedBox(
                width: 16.0,
              )
            ],
          ),
          if (widget.isLoading) const LinearProgressIndicator(),
          const SizedBox(
            height: 32.0,
          ),

          //user image
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ProfileImage(
                photoUrl: currentUser.photoURL,
              ),
              CircleAvatar(
                backgroundColor: kPrimatyColor,
                child: IconButton(
                  splashRadius: 5,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 72.0),

          //const EditProfileFormFields(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomTextField(
              initialValue: currentUser.displayName,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please inter your name';
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
