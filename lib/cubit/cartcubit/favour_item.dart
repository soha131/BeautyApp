import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:flutter/cupertino.dart';


class FavItem {

  final MakeupProduct makeuplist;

  FavItem({required this.makeuplist});
}

class FavModel extends ChangeNotifier {
  final List<FavItem> _items = [];

  List<FavItem> get items => _items;



  void removeItem(MakeupProduct makeup) {
    _items.removeWhere((item) => item.makeuplist.name == makeup.name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

}