part of 'social_signin_cubit.dart';

abstract class SocialSignInStates {}

class SocialSignInInitialState extends SocialSignInStates {}

class GoogleSignInLoadingState extends SocialSignInStates {}

class GoogleSignInSuccessState extends SocialSignInStates {}

class GoogleSignInFailureState extends SocialSignInStates {
  final String errMessage;

  GoogleSignInFailureState(this.errMessage);
}

class FacebookSignInLoadingState extends SocialSignInStates {}

class FacebookSignInSuccessState extends SocialSignInStates {}

class FacebookSignInFailureState extends SocialSignInStates {
  final String errMessage;

  FacebookSignInFailureState(this.errMessage);
}
