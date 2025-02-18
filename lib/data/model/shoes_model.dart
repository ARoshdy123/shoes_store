import 'package:shoes_store/domain/entities/shoes.dart';

/// Class for the shoes data source
abstract class ShoeDataSource {
  Future<List<Shoe>> getShoes();
}
// implementation for
class ShoeDataModelImpl implements ShoeDataSource {
  @override
  Future<List<Shoe>> getShoes() async {
    // Delay to await the data
    await Future.delayed(Duration(seconds: 2));

    // list of shoes model
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
