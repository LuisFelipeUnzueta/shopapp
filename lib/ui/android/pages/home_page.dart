import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocs/home.bloc.dart';
import '../../shared/widgets/category/category_list.category.dart';
import '../../shared/widgets/product/product_list.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            "Categorias",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          CategoryList(
            categories: bloc.categories,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mais Vendidos",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          ProductList(
            products: bloc.products,
          )
        ],
      ),
    );
  }
}
