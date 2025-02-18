import 'package:bloc/bloc.dart';
import 'package:shoes_store/domain/entities/shoes.dart';
import 'package:shoes_store/domain/usecases/get_shoes_list.dart';

part 'shoes_state.dart';

class ShoesCubit extends Cubit<ShoesState> {

  ShoesCubit({required this.getShoesList}) : super(ShoesInitial());
  final GetShoesList getShoesList;

  /// Fetches the list of shoes and updates the state accordingly
  Future<void> getShoes() async {
    try {
      emit(ShoesLoading());
      final shoes = await getShoesList();
      emit(ShoesLoaded(shoes));
    } catch (e) {
      emit(ShoesError("Failed to fetch shoes"));
    }
  }
}
