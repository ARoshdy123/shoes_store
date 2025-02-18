import 'package:shoes_store/domain/entities/shoes.dart';


/// Abstract repository for fetching shoes
abstract class ShoeRepository {
  Future<List<Shoe>> getShoes();
}
