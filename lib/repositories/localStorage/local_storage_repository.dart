import 'package:ecommerce_app/repositories/localStorage/base_local_storage_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/models.dart';

class LocalStorageRepository extends BaseLocalStorage {
  String boxName = 'wishlist_products';
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  List<Product> getWishList(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> adddProductToWishList(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromWishList(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearWishList(Box box) async {
    await box.clear();
  }
}
