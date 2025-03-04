part of 'shoes_cubit.dart';

/// Abstract state for the Shoes Cubit
abstract class ShoesState {}

class ShoesInitial extends ShoesState {}

/// Loading state while fetching data
class ShoesLoading extends ShoesState {}

/// State when shoes are successfully loaded
class ShoesLoaded extends ShoesState {
  final List<Shoe> shoes;
  ShoesLoaded(this.shoes);
}
/// Error state to handel errors
class ShoesError extends ShoesState {
  final String message;
  ShoesError(this.message);
}
