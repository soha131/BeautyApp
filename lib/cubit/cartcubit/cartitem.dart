import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:flutter/cupertino.dart';


class CartItem {
  final MakeupProduct makeuplist;
  int quantity;

  CartItem({required this.makeuplist, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(MakeupProduct makeuplist, int quantity) {
    final index = _items.indexWhere((item) => item.makeuplist.name == makeuplist.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(makeuplist: makeuplist));
    }
    notifyListeners();
  }

  void removeItem(MakeupProduct makeup) {
    _items.removeWhere((item) => item.makeuplist.name == makeup.name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (total, item) => total + double.parse(item.makeuplist.price) * item.quantity);
}