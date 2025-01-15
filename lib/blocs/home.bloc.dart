import 'package:flutter/widgets.dart';

import '../models/category_list_item.model.dart';
import '../models/product_list_item.model.dart';
import '../repositories/category.repository.dart';
import '../repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepository =  CategoryRepository();
  final productRepository =  ProductRepository();

  late List<ProductListItemModel> products;
  late List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = [];
    getProductsByCategory();
    notifyListeners();
  }
}