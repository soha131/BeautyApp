import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'cartitem.dart';


class CartState extends Equatable {
  final List<CartItem> items;
  final double totalPrice;

  CartState({this.items = const [], this.totalPrice = 0.0});

  @override
  List<Object> get props => [items, totalPrice];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addItem(MakeupProduct makeup, int quantity) {
    final existingItem = state.items.firstWhere(
          (item) => item.makeuplist == makeup,
      orElse: () => CartItem(makeuplist: makeup, quantity: 0),
    );

    List<CartItem> updatedItems;
    double updatedTotalPrice;

    if (existingItem.quantity == 0) {
      updatedItems = List<CartItem>.from(state.items)..add(CartItem(makeuplist: makeup, quantity: quantity));
    } else {
      updatedItems = state.items.map((item) {
        if (item.makeuplist == makeup) {
          return CartItem(makeuplist: makeup, quantity: item.quantity + quantity);
        }
        return item;
      }).toList();
    }

    updatedTotalPrice = state.totalPrice + double.parse(makeup.price) * quantity;
    emit(CartState(items: updatedItems, totalPrice: updatedTotalPrice));
  }

  void removeItem(MakeupProduct makeup) {
    final existingItem = state.items.firstWhere((item) => item.makeuplist == makeup);
    final updatedItems = state.items.where((item) => item.makeuplist != makeup).toList();
    final updatedTotalPrice = state.totalPrice - double.parse(existingItem.makeuplist.price) * existingItem.quantity;

    emit(CartState(items: updatedItems, totalPrice: updatedTotalPrice));
  }
}