part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInFailureState extends SignInState {
  final String message;

  SignInFailureState({required this.message});
}
