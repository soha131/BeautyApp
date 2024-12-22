/*
import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<List<MakeupProduct>> {
  WishlistCubit() : super([]);

  void addItem(MakeupProduct makeup) {
    emit(List.from(state)..add(makeup));
  }

  void removeItem(MakeupProduct makeup) {
    emit(List.from(state)..remove(makeup));
  }
}*/
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:beautyapp/product_config/makeup_model.dart';

// State
class WishlistState extends Equatable {
  final List<MakeupProduct> items;

  WishlistState(this.items);

  @override
  List<Object> get props => [items];
}

// Cubit
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistState([]));

  void addItem(MakeupProduct product) {
    emit(WishlistState([...state.items, product]));
  }

  void removeItem(MakeupProduct product) {
    emit(WishlistState(state.items.where((item) => item != product).toList()));
  }
}