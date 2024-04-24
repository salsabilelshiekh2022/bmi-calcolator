part of 'previous_results_cubit.dart';

@immutable
sealed class PreviousResultsState {}

final class PreviousResultsInitial extends PreviousResultsState {}

final class DeleteResultSuccessState extends PreviousResultsState {}

final class DeleteResultFaailureState extends PreviousResultsState {
  final String message;

  DeleteResultFaailureState({required this.message});
}
