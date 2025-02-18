import 'package:shoes_store/domain/entities/shoes.dart';
import 'package:shoes_store/domain/repo/shoes_repo.dart';

/// Use case to get a list of shoes
class GetShoesList {
  final ShoeRepository repository;

  GetShoesList({required this.repository});

  Future<List<Shoe>> call() async {
    return await repository.getShoes();
  }
}
