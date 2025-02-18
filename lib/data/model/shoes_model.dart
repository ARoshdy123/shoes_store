import 'package:shoes_store/domain/entities/shoes.dart';
/// Class for the shoes data source
import 'package:shoes_store/domain/entities/shoes.dart';

/// Class for the shoes data source
abstract class ShoeDataSource {
  Future<List<Shoe>> getShoes();
}

/// A simple implementation that returns dummy data with image URLs
class ShoeDataSourceImpl implements ShoeDataSource {
  @override
  Future<List<Shoe>> getShoes() async {
    // Delay to simulate network call
    await Future.delayed(Duration(seconds: 2));

    // Return a list of dummy shoes with image URLs
    return [
      Shoe(
        id: 1,
        name: "Air Max",
        brand: "Nike",
          imagePath: "assets/images/AM.png"
      ),
      Shoe(
        id: 2,
        name: "Ultra Boost",
        brand: "Adidas",
        imagePath: "assets/images/A2.png",
      ),
      Shoe(
        id: 3,
        name: "Classic",
        brand: "Reebok",
          imagePath: "assets/images/R2.png",
      ),
      Shoe(
        id: 4,
        name: "Classic",
        brand: "Reebok",
          imagePath: "assets/images/A1.png"
      ),
    ];
  }
}
