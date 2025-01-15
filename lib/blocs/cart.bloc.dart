import 'package:flutter/widgets.dart';

import '../models/cart_item.model.dart';

class CartBloc extends ChangeNotifier {
  late List<CartItemModel> cart;
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    var result = false;
    for (var i in cart) {
      if (item.id == i.id) result = true;
    }
    return result;
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0;
    for (var i in cart) {
      total += (i.price * i.quantity);
    }
    notifyListeners();
  }
}