
import 'package:shopapp/models/product_list_item.model.dart';
import 'package:shopapp/settings.dart';
import 'package:dio/dio.dart';

import '../models/product_details.model.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    if(response.statusCode == 200) {
      return (response.data as List).map((course) => ProductListItemModel.fromJson(course)).toList();
    } else {
      return throw Error();
    }
  }
    Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/products/$tag";
    Response response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }
}