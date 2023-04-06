import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/register_add_picture.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/register_text_fields.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key, required this.state});
  final RegisterStates state;
  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = BlocProvider.of<RegisterCubit>(context);
    return SafeArea(
      child: Column(
        children: [
          //back button
          const DefaultBackBtn(),

          //add profile picture
          const RegisterAddPicture(),
          const SizedBox(
            height: 44.0,
          ),

          ///////////////////////
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      //Register TextFields
                      RegisterTextFields(registerCubit: registerCubit),
                      const SizedBox(
                        height: 21.0,
                      ),

                      //Register button
                      widget.state is RegisterLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : DefaultButton(
                              onPressed: () {
                                registerUser(registerCubit);
                              },
                              btnText: 'REGISTER',
                            ),
                      const SizedBox(
                        height: 21.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void registerUser(RegisterCubit registerCubit) {
    if (formKey.currentState!.validate()) {
      registerCubit.registerUser();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
