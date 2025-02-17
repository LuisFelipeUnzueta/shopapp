import 'package:flutter/material.dart';
import 'package:shopapp/models/category_list_item.model.dart';
import 'package:shopapp/ui/shared/widgets/category/category_card.widgets.dart';
import 'package:shopapp/ui/shared/widgets/shared/loader.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(object: categories, callback: list),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel item = categories[index];
        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(item: item),
        );
      },
    );
  }
}
