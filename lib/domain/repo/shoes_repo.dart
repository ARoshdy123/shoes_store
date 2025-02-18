import 'package:shoes_store/domain/entities/shoes.dart';


/// Abstract repository for geting data
abstract class ShoeRepository {
  Future<List<Shoe>> getShoes();
}
