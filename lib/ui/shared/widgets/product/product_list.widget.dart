import 'package:flutter/widgets.dart';

import '../../../../models/product_list_item.model.dart';
import '../shared/loader.widget.dart';
import 'product_card.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemModel> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: Loader(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCard(
            item: products[index],
          ),
        );
      },
    );
  }
}