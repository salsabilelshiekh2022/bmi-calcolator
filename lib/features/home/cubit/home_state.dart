part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PlusNumberState extends HomeState {}

final class MinusNumberState extends HomeState {}

final class ResultSaveSuccessState extends HomeState {}

final class ResultSaveLoadingState extends HomeState {}

final class ResultSaveFailureState extends HomeState {
  final String message;

  ResultSaveFailureState({required this.message});
}
