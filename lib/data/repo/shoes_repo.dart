
import 'package:shoes_store/data/model/shoes_model.dart';
import 'package:shoes_store/domain/entities/shoes.dart';
import 'package:shoes_store/domain/repo/shoes_repo.dart';

/// Implementation of the repository interface
class ShoeRepositoryImpl implements ShoeRepository {
  final ShoeDataSource dataSource;

  ShoeRepositoryImpl({required this.dataSource});

  @override
  Future<List<Shoe>> getShoes() async {
    // get shoes using the data source
    return await dataSource.getShoes();
  }
}
